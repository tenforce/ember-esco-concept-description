`import Ember from 'ember'`
`import layout from '../templates/components/description-item'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`
`import NodeValueMixin from '../mixins/node-value'`

DescriptionItemComponent = Ember.Component.extend  NodeValueMixin,
  layout: layout

  defaultTargetTagName: 'div'
  defaultTargetClassNames: ['description-display-target']

  defaultLabelTagName: 'div'
  defaultLabelClassNames: ['description-display-label']

  labelTagName: Ember.computed 'model.label.tagName', ->
    if @get('model.label.tagName') then @get('model.label.tagName')
    else @get('defaultLabelTagName')
  labelClassNames: Ember.computed 'model.label.classNames', ->
    if @get('model.label.classNames') then @get('model.label.classNames')
    else @get('defaultLabelClassNames')

  targetTagName: Ember.computed 'model.target.tagName', ->
    if @get('model.target.tagName') then @get('model.target.tagName')
    else @get('defaultTargetTagName')
  targetClassNames: Ember.computed 'model.target.classNames', ->
    if @get('model.target.classNames') then @get('model.target.classNames')
    else @get('defaultTargetClassNames')

  actions:
    emptyTarget: (target) ->
      @sendAction('emptyItem', @get('model'))
    emptyLabel: (label) ->
      @set('model.label', null)




`export default DescriptionItemComponent`
