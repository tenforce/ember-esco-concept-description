`import Ember from 'ember'`
`import layout from '../templates/components/description-items'`
`import ClassNamesGetter from '../mixins/class-names-getter'`
`import TagNameGetter from '../mixins/tag-name-getter'`

DescriptionItemsComponent = Ember.Component.extend

  layout: layout
  items: Ember.computed.alias 'model.values'

  defaultTagName: 'div'
  defaultClassNames: ['description-items']

  tagName: 'div'
  classNames: ['description-items']

  checkEmpty: Ember.observer('model.values.length', () ->
    unless @get('model.values.length') > 0 then @sendAction('emptyItems', @get('model'))
  ).on('init')

  actions:
    emptyItem: (item)->
      @get('model.values').removeObject(item)


`export default DescriptionItemsComponent`
