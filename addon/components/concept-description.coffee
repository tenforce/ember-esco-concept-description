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

  ### Note: We make a copy of the config JSON as we will modify the tree and we don't want it to affect the original one ###
  model: Ember.computed 'config', 'concept', ->
    JSON.parse(JSON.stringify(@get('config')))

  defaultTagName: 'div'
  defaultClassNames: ['concept-description']

  actions:
    emptyTitle: (item) ->
      @set('model.title', null)
    emptyHeadings: (headings) ->
      @set('model.headings', null)

`export default ConceptDescriptionComponent`
