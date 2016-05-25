`import Ember from 'ember'`
`import layout from '../templates/components/description-item'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`
`import NodeValueMixin from '../mixins/node-value'`

DescriptionItemComponent = Ember.Component.extend  NodeValueMixin,
  layout: layout
  label: Ember.computed.alias 'model.label'
  target: Ember.computed.alias 'model.target'
  type: Ember.computed.alias 'target.type'
  name: Ember.computed.alias 'target.name'

  init: ->
    this._super()
    console.log "item model : "+JSON.stringify @get('model')

  defaultTagName: 'div'
  defaultClassNames: ['description-item']
  tagName: ''
  classNames: ['']

  titleTagName: Ember.computed.alias 'model.label.tagName'
  titleClassNames: Ember.computed.alias 'model.label.classNames'

  targetTagName: Ember.computed.alias 'model.target.tagName'
  targetClassNames: Ember.computed.alias 'model.target.classNames'

  shouldShow: Ember.computed 'concept', 'model', ->
    @get('value').then (value) ->
      if value?.length > 0 then return true
      else return false

`export default DescriptionItemComponent`
