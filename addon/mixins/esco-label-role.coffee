`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

LabelRole = Ember.Mixin.create HasManyQuery.ModelMixin,
  preflabel: DS.attr('string')

`export default LabelRole`

