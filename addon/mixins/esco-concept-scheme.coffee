`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

ConceptScheme = Ember.Mixin.create HasManyQuery.ModelMixin,
  preflabel: DS.attr('string-set')
  topConcepts: DS.hasMany('concept', inverse: null)
  members: DS.hasMany('concept', inverse: null)
  description: DS.attr('string')

`export default ConceptScheme`
