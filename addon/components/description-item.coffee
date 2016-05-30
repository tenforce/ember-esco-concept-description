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

  tagName: ''
  classNames: ['']

  empty: false

  isEmpty: Ember.observer('empty', () ->
    if @get('empty') is true then @sendAction('emptyItem', @get('model'))
  ).on('init')

  shouldShow: Ember.computed 'concept', 'model', ->
    if @get('model.showEmpty') is true then return @ensurePromise(true)
    else
      @get('value').then (value) =>
        if value?.length > 0 then return true
        else
          @set('empty', true)
          return false


`export default DescriptionItemComponent`
