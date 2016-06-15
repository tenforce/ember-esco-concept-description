`import Ember from 'ember'`
`import layout from '../templates/components/concept-description'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

ConceptDescriptionComponent = Ember.Component.extend
  layout: layout
  title: Ember.computed.alias 'model.title'
  headings: Ember.computed.alias 'model.headings'

  titleTagName: Ember.computed.alias 'model.title.tagName'
  titleClassNames: Ember.computed.alias 'model.title.classNames'

  defaultTitleTagName: 'div'
  defaultTitleClassNames: ['main title']

  getTitleTagName: Ember.computed 'titleTagName', 'defaultTitleTagName', ->
    if @get('titleTagName') then @get('titleTagName')
    else @get 'defaultTitleTagName'
  getTitleClassNames: Ember.computed 'titleClassNames', 'defaultTitleClassNames', ->
    if @get('titleClassNames') then @get('titleClassNames')
    else @get 'defaultTitleClassNames'

  headingsTagName: Ember.computed.alias 'model.headings.tagName'
  headingsClassNames: Ember.computed.alias 'model.headings.classNames'

  defaultHeadingsTagName: 'div'
  defaultHeadingsClassNames: ['headings']

  getHeadingsTagName: Ember.computed 'headingsTagName', 'defaultHeadingsTagName', ->
    if @get('headingsTagName') then @get('headingsTagName')
    else @get 'defaultHeadingsTagName'
  getHeadingsClassNames: Ember.computed 'headingsClassNames', 'defaultHeadingsClassNames', ->
    if @get('headingsClassNames') then @get('headingsClassNames')
    else @get 'defaultHeadingsClassNames'

  ### Note: We make a copy of the config JSON as we will modify the tree and we don't want it to affect the original one ###
  model: Ember.computed 'config', 'concept', ->
    JSON.parse(JSON.stringify(@get('config')))

  defaultTagName: 'div'
  defaultClassNames: ['concept-description']

  tagName: 'div'
  classNames: ['concept-description']

  actions:
    emptyTitle: (item) ->
      @set('model.title', null)
    emptyHeadings: (headings) ->
      @set('model.headings', null)

`export default ConceptDescriptionComponent`
