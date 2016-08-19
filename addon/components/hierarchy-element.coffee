`import Ember from 'ember'`
`import layout from '../templates/components/hierarchy-element'`

HierarchyElementComponent = Ember.Component.extend
  layout: layout
  element: Ember.computed ->
    relatedElement = "concept." + @get 'direction'
    @get(relatedElement).then (relatedConcept) ->
      promises = []

      relatedConcept.forEach (concept) ->
        promises.push(concept.get('defaultPrefLabel'))

      Ember.RSVP.Promise.all(promises).then (labels) ->
          return labels.sort()


`export default HierarchyElementComponent`
