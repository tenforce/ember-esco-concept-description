`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Hierarchy = Ember.Mixin.create HasManyQuery.ModelMixin,
  name: DS.attr('string')
  description: DS.attr('string')
  topConcepts: DS.hasMany('concept', {inverse: null})

`export default Hierarchy`

