`import Ember from 'ember'`
`import layout from '../templates/components/description-item-abstract'`

DescriptionItemAbstractComponent = Ember.Component.extend
  layout: layout

  label: Ember.computed.alias 'model.label'
  target: Ember.computed.alias 'model.target'

  defaultTagName: 'div'
  defaultClassNames: ['']

  tagName: ''
  classNames: ['']

  getTagName: Ember.computed 'model.tagName', 'defaultTagName', ->
    if @get('model.tagName') then @get('model.tagName')
    else @get('defaultTagName')
  getClassNames: Ember.computed 'model.classNames', 'defaultClassNames', ->
    if @get('model.classNames') then @get('model.classNames')
    else @get('defaultClassNames')

  actions:
    emptyItem: (item) ->
      @sendAction('emptyItem', @get('model'))

`export default DescriptionItemAbstractComponent`
