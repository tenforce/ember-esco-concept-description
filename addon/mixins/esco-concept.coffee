`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

EscoConceptMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  # note: computed properties need promise so await will work...
  KNOWLEDGE_IRI: "uriForKnowledge"
  SKILL_IRI: "uriForSkill"

  defaultLanguage: "en"
  code: DS.attr('string')
  prefLabels: DS.hasMany('concept-label')
  altLabels: DS.hasMany('concept-label')
  hiddenLabels: DS.hasMany('concept-label')
  description: DS.attr('lang-string-set')
  definition: DS.attr('lang-string-set')
  narrower: DS.hasMany('concept', {inverse: 'broader'})
  broader: DS.hasMany('concept', {inverse: 'narrower'})
  relations: DS.hasMany('concept-relation', {inverse: 'from'})
  skillType: DS.attr('string')
  optionalKnowledges: Ember.computed 'relations', ->
    @get('relations').then (relations) =>
      promises = []
      promises = relations.map (item) ->
        promises.push(item.get('to'))
      Ember.RSVP.all(promises).then =>
        relations?.filter( (item) ->
          item.get('type') == 'http://data.europa.eu/esco/RelationshipType#iC.optionalSkill' and
            item.get('skillType') is @get('KNOWLEDGE_IRI')
        )?.map (item) ->
          item.get('to')
  optionalSkills: Ember.computed 'relations', ->
    @get('relations').then (relations) =>
      promises = []
      promises = relations.map (item) ->
        promises.push(item.get('to'))
      Ember.RSVP.all(promises).then =>
        relations?.filter( (item) ->
          item.get('type') == 'http://data.europa.eu/esco/RelationshipType#iC.optionalSkill' and
          item.get('skillType') is @get('SKILL_IRI')
        )?.map (item) ->
          item.get('to')
  essentialSkills: Ember.computed 'relations', ->
    @get('relations').then (relations) =>
      promises = []
      promises = relations.map (item) ->
        promises.push(item.get('to'))
      Ember.RSVP.all(promises).then =>
        relations?.filter( (item) ->
          item.get('type') is 'http://data.europa.eu/esco/RelationshipType#iC.essentialSkill' and
          item.get('skillType') is @get('SKILL_IRI')
        )?.map (item) ->
          item.get('to')
  essentialKnowledges: Ember.computed 'relations', ->
    @get('relations').then (relations) =>
      promises = []
      promises = relations.map (item) ->
        promises.push(item.get('to'))
      Ember.RSVP.all(promises).then =>
        relations?.filter( (item) ->
          item.get('type') is 'http://data.europa.eu/esco/RelationshipType#iC.essentialSkill' and
            item.get('skillType') is @get('KNOWLEDGE_IRI')
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
