`import Ember from 'ember'`
`import layout from '../templates/components/description-display-values'`

DescriptionDisplayValuesComponent = Ember.Component.extend
  layout:layout
  init: ->
    this._super()
  empty: false
  checkValue: Ember.observer('values', ()->
    @get('values').then (values) =>
      unless ((values?.length > 0) or (values?.content?.length)) then @set('empty', true)
  ).on('init')

  checkEmpty: Ember.observer('empty', ()->
    if @get('empty') then @sendAction('emptyValues', @get('model'))
  ).on('init')

`export default DescriptionDisplayValuesComponent`
