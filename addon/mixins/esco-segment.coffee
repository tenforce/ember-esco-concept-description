`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Segment = Ember.Mixin.create HasManyQuery.ModelMixin,
  preflabel: DS.attr('string')
  description: DS.attr('string')
  hierarchies: DS.hasMany('hierarchy', {inverse: null})
  primaryHierarchy: DS.belongsTo('hierarchy', {inverse: null})

`export default Segment`

