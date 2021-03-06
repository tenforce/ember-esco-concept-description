`import Ember from 'ember'`
`import layout from '../templates/components/show-hierarchy'`

ShowHierarchyComponent = Ember.Component.extend
  layout: layout
  properties: Ember.computed.alias 'model.properties'
  title: Ember.computed.alias 'properties.title'
  conceptScheme: Ember.computed.alias 'properties.conceptSchemeId'
  showHierarchyElements: false

  actions:
    showElements: ->
      @toggleProperty('showHierarchyElements')
      false


`export default ShowHierarchyComponent`
