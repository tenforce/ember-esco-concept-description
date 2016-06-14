`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

EscoConceptMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  # note: computed properties need promise so await will work...
  KNOWLEDGE_IRI: "http://data.europa.eu/esco/SkillCompetenceType#iC.Knowledge"
  SKILL_IRI: "http://data.europa.eu/esco/SkillCompetenceType#iC.Skill"
  OPTIONAL_SKILL_IRI: "http://data.europa.eu/esco/RelationshipType#iC.optionalSkill"
  ESSENTIAL_SKILL_IRI: "http://data.europa.eu/esco/RelationshipType#iC.essentialSkill"

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
  filterSkills: (type, skillType) ->
    @get('relations').then (relations) =>
      promises = relations.map (item) ->
        Ember.RSVP.hash({to: item.get('to'), relation: item})
      Ember.RSVP.all(promises).then (filtered) ->
        relations = []
        filtered.map (hash) ->
          relation = hash.relation
          target = hash.to
          if relation.get('type') is type and target.get('skillType') is skillType
            relations.push target
        relations
  optionalKnowledges: Ember.computed 'relations', ->
    @filterSkills(@get('OPTIONAL_SKILL_IRI'), @get('KNOWLEDGE_IRI'))
  optionalSkills: Ember.computed 'relations', ->
    @filterSkills(@get('OPTIONAL_SKILL_IRI'), @get('SKILL_IRI'))
  essentialSkills: Ember.computed 'relations', ->
    @filterSkills(@get('ESSENTIAL_SKILL_IRI'), @get('SKILL_IRI'))
  essentialKnowledges: Ember.computed 'relations', ->
    @filterSkills(@get('ESSENTIAL_SKILL_IRI'), @get('KNOWLEDGE_IRI'))
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
