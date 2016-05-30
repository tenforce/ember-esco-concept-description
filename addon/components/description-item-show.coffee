`import Ember from 'ember'`
`import layout from '../templates/components/description-item-show'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

DescriptionItemShowComponent = Ember.Component.extend ClassNamesGetterMixin, TagNameGetterMixin,
  layout: layout
  label: Ember.computed.alias 'model.label'
  target: Ember.computed.alias 'model.target'

  defaultTagName: 'div'
  defaultClassNames: ['description-item']

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

`export default DescriptionItemShowComponent`
