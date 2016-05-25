`import Ember from 'ember'`
`import layout from '../templates/components/description-item-show'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

DescriptionItemShowComponent = Ember.Component.extend ClassNamesGetterMixin, TagNameGetterMixin,
  layout: layout
  label: Ember.computed.alias 'model.label'
  target: Ember.computed.alias 'model.target'

  init: ->
    this._super()
    console.log "item model : "+JSON.stringify @get('model')

  defaultTagName: 'div'
  defaultClassNames: ['description-item-show']

  titleTagName: Ember.computed.alias 'model.label.tagName'
  titleClassNames: Ember.computed.alias 'model.label.classNames'

  targetTagName: Ember.computed.alias 'model.target.tagName'
  targetClassNames: Ember.computed.alias 'model.target.classNames'

`export default DescriptionItemShowComponent`
