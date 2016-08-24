`import Ember from 'ember'`
`import layout from '../templates/components/popup-component'`
`import ClickElsewhereMixin from '../mixins/click-elsewhere'`

PopupComponentComponent = Ember.Component.extend ClickElsewhereMixin,
  layout:layout
  displayPopup: false

  onClickElsewhere: ->
    if @get 'displayPopup'
      @toggleProperty 'displayPopup'

  actions:
    togglePopup: ->
      @toggleProperty 'displayPopup'
      false


`export default PopupComponentComponent`
