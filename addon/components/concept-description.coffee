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
  showAltLabels: Ember.computed.notEmpty 'concept.altLabels'
  showUri: true
  optionalSkills: Ember.computed 'concept.optionalSkills', ->
    @get('concept.optionalSkills').sortBy('preflabel')
  essentialSkills: Ember.computed 'concept.essentialSkills', ->
    @get('concept.essentialSkills').sortBy('preflabel')  
  showHiddenLabels: Ember.computed.notEmpty 'concept.altLabels'  
  showOptionalSkills: Ember.computed.notEmpty 'concept.optionalSkills'
  showEssentialSkills: Ember.computed.notEmpty 'concept.essentialSkills'
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
      @set 'fullDetail', not @get('fullDetail')


`export default ConceptDescriptionComponent`
