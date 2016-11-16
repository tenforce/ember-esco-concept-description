`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

EscoConceptMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  # note: computed properties need promise so await will work...
  defaultLanguage: "en"
  code: DS.attr('string')
  prefLabels: DS.hasMany('concept-label')
  altLabels: DS.hasMany('concept-label')
  hiddenLabels: DS.hasMany('concept-label')
  description: DS.attr('lang-string-set')
  definition: DS.attr('lang-string-set')
  narrower: DS.hasMany('concept', {inverse: 'broader'})
  broader: DS.belongsTo('concept', {inverse: 'narrower'})
  relations: DS.hasMany('concept-relation', {inverse: 'from'})
  optionalSkills: Ember.computed 'relations', ->
    @get('relations').then (relations) =>
      relations?.filter( (item) ->
        item.get('type') == 'http://data.europa.eu/esco/RelationshipType#iC.optionalSkill'
      )?.map (item) ->
        item.get('to')
  essentialSkills: Ember.computed 'relations', ->
    @get('relations').then (relations) =>
      relations?.filter( (item) ->
        item.get('type') == 'http://data.europa.eu/esco/RelationshipType#iC.essentialSkill'
      )?.map (item) ->
        item.get('to')
  defaultDescription: Ember.computed 'description.@each.language', ->
    @get('description')?.filterBy('language', @get('defaultLanguage'))?.get('firstObject.content')
  defaultPrefLabel: Ember.computed 'defaultPrefLabels.firstObject.literalForm', ->
    @get('defaultPrefLabels')?.then (labels) ->
      labels.get('firstObject.literalForm')
  defaultAltLabels: Ember.computed 'altLabels', 'defaultLanguage', ->
    @get('altLabels')?.then (labels) =>
      Ember.ArrayProxy.create content: labels?.filterBy('language', @get('defaultLanguage'))
  defaultPrefLabels: Ember.computed 'prefLabels', 'defaultLanguage', ->
    @get('prefLabels')?.then (labels) =>
      Ember.ArrayProxy.create content: labels?.filterBy('language', @get('defaultLanguage'))
  defaultHiddenLabels:Ember.computed 'hiddenLabels', 'defaultLanguage', ->
    @get('hiddenLabels')?.then (labels) =>
      Ember.ArrayProxy.create content: labels?.filterBy('language', @get('defaultLanguage'))


`export default EscoConceptMixin`
