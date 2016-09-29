`import Ember from 'ember'`
`import DS from 'ember-data'`

ConceptRelation = Ember.Mixin.create
  type: DS.attr('string')
  from: DS.belongsTo('concept', inverse: null)
  to: DS.belongsTo('concept', inverse: null)

`export default ConceptRelation`
