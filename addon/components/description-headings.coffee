`import Ember from 'ember'`
`import layout from '../templates/components/description-headings'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

DescriptionHeadingsComponent = Ember.Component.extend ClassNamesGetterMixin, TagNameGetterMixin,
  layout: layout
  headings: Ember.computed.alias 'model.values'

  defaultTagName: 'div'
  defaultClassNames: ['description-headings']

`export default DescriptionHeadingsComponent`
