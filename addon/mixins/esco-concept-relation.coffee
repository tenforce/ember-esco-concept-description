`import Ember from 'ember'`
`import DS from 'ember-data'`

ConceptRelation = Ember.Mixin.create
  type: DS.attr('string')
  from: DS.belongsTo('concept')
  to: DS.belongsTo('concept')

`export default ConceptRelation`
