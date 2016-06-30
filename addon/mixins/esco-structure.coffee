`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Structure = Ember.Mixin.create HasManyQuery.ModelMixin,
  name: DS.attr('string')
  description: DS.attr('string')
  # TODO Currently not supported deeply. 
  predicate: DS.attr('string')
  conceptScheme: DS.attr('string')

`export default Structure`

