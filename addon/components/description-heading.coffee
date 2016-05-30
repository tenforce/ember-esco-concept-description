`import Ember from 'ember'`
`import layout from '../templates/components/description-heading'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

DescriptionHeadingComponent = Ember.Component.extend ClassNamesGetterMixin, TagNameGetterMixin,
  layout: layout
  title: Ember.computed.alias 'model.title'
  items: Ember.computed 'model.items', ->
    if @get('model.items') then @get('model.items')
    else []

  titleTagName: Ember.computed.alias 'model.title.tagName'
  titleClassNames: Ember.computed.alias 'model.title.classNames'

  defaultTagName: 'div'
  defaultClassNames: ['description-heading']

  actions:
    emptyTitle: (item) ->
      @set('model.title', null)
    emptyItems: (items) ->
      @sendAction('emptyHeading', @get('model'))

`export default DescriptionHeadingComponent`
