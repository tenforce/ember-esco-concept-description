`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

EscoConceptMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  defaultLanguage: "en"
  prefLabels: DS.hasMany('concept-label')
  uri: DS.attr('string')
  decodedUri: Ember.computed 'uri', ->
    decodeURIComponent(@get('uri'))
  altLabels: DS.hasMany('concept-label')
  hiddenLabels: DS.hasMany('concept-label')
  description: DS.attr('lang-string-set')
  definition: DS.attr('string')
  narrower: DS.hasMany('concept', {inverse: 'broader'})
  broader: DS.hasMany('concept', {inverse: 'narrower'})
  topConceptOf: DS.belongsTo('taxonomy', {inverse: 'topConcepts'})
  taxonomy: DS.belongsTo('taxonomy', {inverse: null})
  relations: DS.hasMany('concept-relation', {inverse: 'from'})
  optionalSkills: Ember.computed 'relations', ->
    @get('relations').filter( (item) ->
      item.get('type') == 'http://data.europa.eu/esco/RelationshipType#iC.optionalSkill'
    ).map (item) ->
      item.get('to')
  essentialSkills: Ember.computed 'relations', ->
    @get('relations').filter( (item) ->
      item.get('type') == 'http://data.europa.eu/esco/RelationshipType#iC.essentialSkill'
    ).map (item) ->
      item.get('to')
  defaultDescription: Ember.computed 'description.@each.language', ->
    @get('description').filterBy('language', @get('defaultLanguage')).get('firstObject.content')
  defaultPrefLabel: Ember.computed.alias 'defaultPrefLabels.firstObject.literalForm'
  defaultAltLabels: Ember.computed 'altLabels', 'defaultLanguage', ->
    Ember.ArrayProxy.create content: @get('altLabels').filterBy('language', @get('defaultLanguage'))
  defaultPrefLabels: Ember.computed.filterBy 'prefLabels', 'defaultLanguage', ->
    Ember.ArrayProxy.create content: @get('prefLabels').filterBy('language', @get('defaultLanguage'))
  defaultHiddenLabels:Ember.computed.filterBy 'hiddenLabels', 'defaultLanguage', ->
    Ember.ArrayProxy.create content: @get('hiddenLabels').filterBy('language', @get('defaultLanguage'))


`export default EscoConceptMixin`
