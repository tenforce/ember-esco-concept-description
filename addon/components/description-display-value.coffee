`import Ember from 'ember'`
`import layout from '../templates/components/description-display-value'`

DescriptionDisplayValueComponent = Ember.Component.extend
  layout: layout

  checkValue: Ember.observer('value', ()->
    @get('value').then (value) =>
      unless value then @sendAction('emptyValue')
  ).on('init')

`export default DescriptionDisplayValueComponent`
