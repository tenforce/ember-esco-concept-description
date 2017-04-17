`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Structure = Ember.Mixin.create HasManyQuery.ModelMixin,
  name: DS.attr('string')
  description: DS.attr('string')
  default: DS.attr('boolean')

`export default Structure`

