`import Ember from 'ember'`
`import layout from '../templates/components/description-heading-abstract'`

DescriptionHeadingAbstractComponent = Ember.Component.extend
  layout: layout
  title: Ember.computed.alias 'model.title'
  items: Ember.computed 'model.items', ->
    if @get('model.items') then @get('model.items')
    else []

  tagName: ''
  classNames: ['']

  defaultTagName: 'div'
  defaultClassNames: ['description-heading']

  getTagName: Ember.computed 'model.tagName', 'defaultTagName', ->
    if @get('model.tagName') then @get('model.tagName')
    else @get('defaultTagName')
  getClassNames: Ember.computed 'model.classNames', 'defaultClassNames', ->
    if @get('model.classNames') then @get('model.classNames')
    else @get('defaultClassNames')

  actions:
    emptyTitle: (item) ->
      @set('model.title', null)
    emptyHeading: (item) ->
      @sendAction('emptyHeading', @get('model'))

`export default DescriptionHeadingAbstractComponent`
