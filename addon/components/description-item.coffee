`import Ember from 'ember'`
`import layout from '../templates/components/description-item'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

DescriptionItemComponent = Ember.Component.extend ClassNamesGetterMixin, TagNameGetterMixin,
  layout: layout
  title: Ember.computed.alias 'model.title'
  target: Ember.computed.alias 'model.target'

  init: ->
    this._super()
    console.log "item model : "+JSON.stringify @get('model')

  defaultTagName: 'div'
  defaultClassNames: ['description-item']

  titleTagName: Ember.computed.alias 'model.title.tagName'
  titleClassNames: Ember.computed.alias 'model.title.classNames'

  targetTagName: Ember.computed.alias 'model.target.tagName'
  targetClassNames: Ember.computed.alias 'model.target.classNames'

`export default DescriptionItemComponent`
