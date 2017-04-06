`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

LabelRole = Ember.Mixin.create HasManyQuery.ModelMixin,
  preflabel: DS.attr('string')
  # we use this property in order to be able to change the displayed label without changing the data, override in model when you need smthg else
  displayLabel: Ember.computed.alias 'preflabel'

`export default LabelRole`

