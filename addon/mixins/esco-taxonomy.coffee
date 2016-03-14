`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

Taxonomy = Ember.Mixin.create HasManyQuery.ModelMixin,
  preflabel: DS.attr('string')
  description: DS.attr('string')
  topConcepts: DS.hasMany('concept', {inverse: 'topConceptOf'})

`export default Taxonomy`

