`import Ember from 'ember'`
`import layout from '../templates/components/concept-description'`

ConceptDescriptionComponent = Ember.Component.extend
  layout: layout
  classNames: ["concept"]
  codes: [
    { name: "ISCO", data: "iscoCode" },
    { name: "NACE", data: "naceCode" }
  ]
  fullDetail: false
  hasDetail: Ember.computed.or 'showOptionalSkills', 'showEssentialSkills'
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
