`import Ember from 'ember'`
`import layout from '../templates/components/description-items'`
`import ClassNamesGetter from '../mixins/class-names-getter'`
`import TagNameGetter from '../mixins/tag-name-getter'`

DescriptionItemsComponent = Ember.Component.extend ClassNamesGetter, TagNameGetter,
  layout: layout
  items: Ember.computed.alias 'model.values'

  defaultTagName: 'div'
  defaultClassNames: ['description-items']


`export default DescriptionItemsComponent`
