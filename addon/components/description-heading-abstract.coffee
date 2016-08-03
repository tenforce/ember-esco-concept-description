`import Ember from 'ember'`
`import layout from '../templates/components/description-heading-abstract'`

DescriptionHeadingAbstractComponent = Ember.Component.extend
  layout: layout
  title: Ember.computed.alias 'model.title'
  items: Ember.computed 'model.items', ->
    if @get('model.items') then @get('model.items')
    else []
  displayEmpty: Ember.computed.alias 'model.displayEmpty'
  empty: false
  displayAlternate: Ember.computed 'empty', 'displayEmpty', ->
    if @get('empty') and @get('displayEmpty')
      @get('items.values').push(@get('displayEmpty'))
      return true
    else return false

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
      unless @get('model.displayEmpty')
        @set('model.title', null)
    emptyHeading: (item) ->
      if @get('model.displayEmpty')
        @set('empty', true)
        return false
      else
        @sendAction('emptyHeading', @get('model'))

`export default DescriptionHeadingAbstractComponent`
