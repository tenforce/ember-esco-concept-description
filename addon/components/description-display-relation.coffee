`import Ember from 'ember'`
`import layout from '../templates/components/description-display-relation'`

DescriptionDisplayRelationComponent = Ember.Component.extend
  layout: layout
  value: Ember.computed  'name', 'model', ->
    @get('model').then (model) =>
      model.get(@get('name'))


`export default DescriptionDisplayRelationComponent`
