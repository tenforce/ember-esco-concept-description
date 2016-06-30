`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Segment = Ember.Mixin.create HasManyQuery.ModelMixin,
  preflabel: DS.attr('string')
  topConcepts: DS.hasMany('concept', inverse: null)
  description: DS.attr('string')
  structures: DS.hasMany('structure', inverse: null)

`export default Segment`

