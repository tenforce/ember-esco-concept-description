`import Ember from 'ember'`
`import layout from '../templates/components/description-display-relation'`

DescriptionDisplayRelationComponent = Ember.Component.extend
  layout: layout
  value: Ember.computed  'name', 'model', ->
    if @get('model').then
      @get('model').then (model) =>
        model.get(@get('name'))
    else
      new Ember.RSVP.Promise (resolve) => resolve(@get('model').get(@get('name')))
  checkValue: Ember.observer('value', ()->
    @get('value').then (value) =>
      unless value then @sendAction('emptyRelationValue', @get('model'))
  ).on('init')


`export default DescriptionDisplayRelationComponent`
