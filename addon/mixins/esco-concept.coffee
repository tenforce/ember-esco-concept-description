`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

# Mixin that defines the ESCO concept model
# The idea is that the models in the app/models/concept.js inherit
# from this mixin.
#
# note: computed properties need promise so await will work...
#
# The ESCO concept is
EscoConceptMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  # basic URIS that define the relationship between a skill and a concept
  KNOWLEDGE_IRI: "http://data.europa.eu/esco/SkillCompetenceType#iC.Knowledge"
  SKILL_IRI: "http://data.europa.eu/esco/SkillCompetenceType#iC.Skill"
  OPTIONAL_SKILL_IRI: "http://data.europa.eu/esco/RelationshipType#iC.optionalSkill"
  ESSENTIAL_SKILL_IRI: "http://data.europa.eu/esco/RelationshipType#iC.essentialSkill"
  OCCUPATION_IRI: "http://data.europa.eu/esco/model#Occupation"

  # Members
  defaultLanguage: "en"
  code: DS.attr('string')
  prefLabels: DS.hasMany('concept-label')
  altLabels: DS.hasMany('concept-label')
  hiddenLabels: DS.hasMany('concept-label')
  description: DS.attr('lang-string-set')
  definition: DS.attr('lang-string-set')
  scopeNote: DS.attr('lang-string-set')
  narrower: DS.hasMany('concept', {inverse: 'broader'})
  broader: DS.hasMany('concept', {inverse: 'narrower'})
  relations: DS.hasMany('concept-relation', {inverse: 'from'})
  inverseRelations: DS.hasMany('concept-relation', {inverse: 'to'})
  skillType: DS.attr('string-set')

  # function to indicate that this concept is an occupation
  isOccupation: Ember.computed 'types', ->
    if @get('types').contains "http://data.europa.eu/esco/model#Occupation" then return true
    else return false

  # function to indicate that this concept is a skill
  isSkill: Ember.computed 'types', ->
    if @get('types').contains "http://data.europa.eu/esco/model#Skill" then return true
    else return false

  # Returns an array containing all skills that are
  #  - of the said type
  #  - pass the given filter
  # The base for the array is the @get('relations') promise unless
  # the inverse argument is set to true in which case it uses @get('inverseRelations')
  filterRelations: (type, filter, inverse) ->
    # define and fetch the relation promise
    relation = null
    if inverse
      relation = @get('inverseRelations')
    else
      relation = @get('relations')
    relation.then (relations) =>
      promises = relations.map (item) ->
        # check the esco-concept-relation mixin int he same folder
        # to see the model (/mixin) for the relations
        # and the domain.lisp file to see the way mu-cl-resources
        # handles this relationship object
        #
        #
        # the 'from' is the URI for an occupation (isRelationshipFor in the db)
        # the 'to' is the URI for a skill (refersConcept in the db)
        # if the inverse attribute is set to true, then we use the 'from' promises
        # otherwise we use the 'to' promises
        Ember.RSVP.hash({target: item.get(if inverse then 'from' else 'to'), relation: item})
      Ember.RSVP.all(promises).then (filtered) ->
        relations = []
        # we filter the promises depending on the type and the filter
        # the type can be either knowledge or skill
        # and the filter can be essential or optional skill
        filtered.map (hash) ->
          relation = hash.relation
          target = hash.target
          if type in relation.get('type') and filter(target)
            relations.push target
        # returns the relations array
        relations

  # helper function to check the skill type of a concept
  # used to define if this concept is a skill or a knowledge
  # returns a function that checks for the type
  _shouldMatchSkillType: (skillType) ->
    type = @get(skillType)
    # (target) -> target.get('skillType') is type
    (target) -> type in target.get('skillType')



  optionalSkillFor: Ember.computed 'inverseRelations', ->
    @filterRelations(@get('OPTIONAL_SKILL_IRI'), ((target) -> target.get('isOccupation')), true)
  essentialSkillFor: Ember.computed 'inverseRelations', ->
    @filterRelations(@get('ESSENTIAL_SKILL_IRI'), ((target) -> target.get('isOccupation')), true)


  # arrays that contain different types of skills
  # these for arrays are the split up form of the relations
  # it separates the skills depending on the type of the skill (skill/knowledge)
  # and the relation (optional skill/knowledge, essential skill/knowledge)
  optionalKnowledges: Ember.computed 'relations', ->
    @filterRelations(@get('OPTIONAL_SKILL_IRI'), @_shouldMatchSkillType('KNOWLEDGE_IRI'))
  optionalSkills: Ember.computed 'relations', ->
    @filterRelations(@get('OPTIONAL_SKILL_IRI'), @_shouldMatchSkillType('SKILL_IRI'))
  essentialSkills: Ember.computed 'relations', ->
    @filterRelations(@get('ESSENTIAL_SKILL_IRI'), @_shouldMatchSkillType('SKILL_IRI'))
  essentialKnowledges: Ember.computed 'relations', ->
    @filterRelations(@get('ESSENTIAL_SKILL_IRI'), @_shouldMatchSkillType('KNOWLEDGE_IRI'))

  defaultDescription: Ember.computed 'description.@each.language',
    get: (key) ->
      @get('description')?.filterBy('language', @get('defaultLanguage'))?.get('firstObject.content')
    set: (key, value) ->
      if @get 'description'
        desc = @get('description')?.filterBy('language', @get('defaultLanguage'))
        desc?.set('firstObject.content', value)
      else
        @set 'description', [{content: value, language: @get('defaultLanguage')}]

  defaultScopeNote: Ember.computed 'scopeNote.@each.language',
    get: (key) ->
      @get('scopeNote')?.filterBy('language', @get('defaultLanguage'))?.get('firstObject.content')
    set: (key, value) ->
      if @get 'scopeNote'
        desc = @get('scopeNote')?.filterBy('language', @get('defaultLanguage'))
        desc?.set('firstObject.content', value)
      else
        @set 'scopeNote', [{content: value, language: @get('defaultLanguage')}]

  defaultPrefLabel: Ember.computed 'defaultPrefLabels.firstObject.literalForm',
    get: (key) ->
      @get('defaultPrefLabels')?.then (labels) ->
        labels.get('firstObject.literalForm')
    set: (key, value) ->
      @get('defaultPrefLabels')?.then (labels) ->
        debugger
        labels?.set('firstObject.literalForm', value)
        labels?.get('firstObject')?.save()


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
