`import Ember from 'ember'`
`import layout from '../templates/components/concept-description'`

ConceptDescriptionComponent = Ember.Component.extend
  layout: layout
  classNames: ["concept"]
  classNameBindings: [ "fullDetail:open" ]
  codes: [
    { name: "ISCO", data: "iscoCode" },
    { name: "NACE", data: "naceCode" }
  ]
  fullDetail: false
  hasDetail: Ember.computed 'showOptionalSkills', 'showEssentialSkills', ->
    Ember.RSVP.hash(
      optional: @get('showOptionalSkills')
      essential: @get('showEssentialSkills')
    ).then (hash) ->
      hash.optional or hash.essential
  showAltLabels: Ember.computed 'concept.defaultAltLabels', ->
    @get('concept.defaultAltLabels').then (labels) ->
      not Ember.isEmpty(labels)
  showHiddenLabels: Ember.computed 'concept.defaultHiddenLabels', ->
    @get('concept.defaultHiddenLabels').then (labels) ->
      not Ember.isEmpty(labels)
  showUri: true
  optionalSkills: Ember.computed 'concept.optionalSkills', ->
    @get('concept.optionalSkills').then (skills) ->
      skills.sortBy('defaultPrefLabel.literalForm')
  _getSkillLabels: (skills) ->
    promises = skills.map (skill) ->
      skill.get('defaultPrefLabel')
    Ember.RSVP.all(promises)
  optionalSkillLabels: Ember.computed 'concept.optionalSkills', ->
    @get('concept.optionalSkills').then (skills) =>
      @_getSkillLabels(skills)
  essentialSkillLabels: Ember.computed 'concept.essentialSkills', ->
    @get('concept.essentialSkills').then (skills) =>
      @_getSkillLabels(skills)
  essentialSkills: Ember.computed 'concept.essentialSkills', ->
    @get('concept.essentialSkills').then (skills) ->
      skills.sortBy('defaultPrefLabel.literalForm')
  showOptionalSkills: Ember.computed 'concept.optionalSkills', ->
    @get('concept.optionalSkills').then (skills) ->
      not Ember.isEmpty(skills)
  showEssentialSkills: Ember.computed 'concept.essentialSkills', ->
    @get('concept.essentialSkills').then (skills) ->
      not Ember.isEmpty(skills)
  showCodes: Ember.computed.notEmpty 'visibleCodes'
  visibleCodes: Ember.computed 'codes', 'concept.isLoaded', ->
    result = []
    codes = @get 'codes'
    codes.map (code) =>
      if @get "concept.#{code.data}"
        result.push code
    return result
  actions:
    toggleDetail: ->
      @toggleProperty 'fullDetail'


`export default ConceptDescriptionComponent`
