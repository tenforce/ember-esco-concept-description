`import Ember from 'ember'`
`import layout from '../templates/components/concept-description'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

ConceptDescriptionComponent = Ember.Component.extend ClassNamesGetterMixin, TagNameGetterMixin,
  layout: layout
  title: Ember.computed.alias 'model.title'
  headings: Ember.computed.alias 'model.headings'

  titleTagName: Ember.computed.alias 'model.title.tagName'
  titleClassNames: Ember.computed.alias 'model.title.classNames'

  defaultTagName: 'div'
  defaultClassNames: ['concept-description']

`export default ConceptDescriptionComponent`
