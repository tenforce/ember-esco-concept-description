`import Ember from 'ember'`
`import layout from '../templates/components/popup-component'`

PopupComponentComponent = Ember.Component.extend
  layout:layout
  displayPopup: false

  actions:
    togglePopup: ->
      @toggleProperty 'displayPopup'


`export default PopupComponentComponent`
