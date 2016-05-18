`import Ember from 'ember'`
`import layout from '../templates/components/description-item'`

DescriptionItemComponent = Ember.Component.extend
  layout: layout
  title: Ember.computed.alias 'item.title'
  type: Ember.computed.alias 'item.type'
  name: Ember.computed.alias 'item.name'
  component: Ember.computed.alias 'item.component'
  tagName: Ember.computed 'item.tagName', ->
    if @get('item.tagName') then @get('item.tagName')
    else ''
  className: Ember.computed 'item.className', ->
    if @get('item.className') then @get('item.className')
    else ''

`export default DescriptionItemComponent`
