`import Ember from 'ember'`
`import layout from '../templates/components/description-display'`
`import NodeValue from '../mixins/node-value'`

DescriptionDisplayComponent = Ember.Component.extend NodeValue,
  layout: layout
  type: Ember.computed.alias 'model.type'
  name: Ember.computed.alias 'model.name'

  defaultTagName: 'div'
  defaultClassNames: ['description-display']

  getTagName: Ember.computed 'pTagName', 'model.tagName', ->
    if @get('pTagName') then @get('pTagName')
    else @get('defaultTagName')
  getClassNames: Ember.computed 'pClassNames', 'model.classNames', ->
    if @get('pClassNames') then @get('pClassNames')
    else @get('defaultClassNames')

  tagName: ''
  classNames: ['']

  relation: Ember.computed.alias 'model.relation'
  subName: Ember.computed.alias 'relation.name'


  isArray: Ember.computed 'value', ->
    @get('value').then (value) ->
      if value instanceof Array
        return true
      else
        return false

  checkValue: Ember.observer('value', ()->
    @get('value').then (value) =>
      unless value?.length > 0 then @set('empty', true)
  ).on('init')

  empty: false

  checkEmpty: Ember.observer('empty', ()->
    if @get('empty') then @sendAction('emptyValue', @get('model'))
  ).on('init')

  emptyRelations: 0

  checkValueLength: Ember.observer('emptyRelations', ()->
      emptyCount = @get('emptyRelations')
      @get('value').then (values) =>
        if @get('type') is 'hasMany' and not values instanceof Array
          @set('empty', true)
        if values?.length is emptyCount
          @set('empty', true)
  ).on('init')

  actions:
    emptyRelationMany: (value) ->
      @set('emptyRelations', (@get('emptyRelations')+1))
    emptyRelationOne: (value) ->
      @set('empty', true)

`export default DescriptionDisplayComponent`