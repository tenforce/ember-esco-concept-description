`import Ember from 'ember'`
`import layout from '../templates/components/description-display-relations'`

DescriptionDisplayRelationsComponent = Ember.Component.extend
  layout: layout
  tagName: ''

  checkValueLength: Ember.observer('values.length', ()->
    @get('values').then (values) =>
      if values?.get('length') is 0 then @sendAction('emptyRelations', @get('values'))
  ).on('init')

  actions:
    emptyRelationValue: (value) ->
      @get('values').then (values) ->
        values.removeObject(value)


`export default DescriptionDisplayRelationsComponent`
