`import Ember from 'ember'`
`import layout from '../templates/components/hierarchy-element'`

HierarchyElementComponent = Ember.Component.extend
  layout: layout

  popupButtonId: Ember.computed ->
    (@get('buttonId') + @get('title')).replace(/ /g,'')

  element: Ember.computed ->
    direction = @get 'direction'
    relatedElement = "concept." + direction

    # TODO untested. Don't know if/where this code is still used. 
    switch direction
      when 'broader'
        @get(relatedElement).then (relatedConcept) ->
          Ember.RSVP.resolve [relatedConcept.get('defaultPrefLabel')]
      when 'narrower'
        @get(relatedElement).then (relatedConcept) ->
          promises = []

          relatedConcept.forEach (concept) ->
            promises.push(concept.get('defaultPrefLabel'))

          Ember.RSVP.Promise.all(promises).then (labels) ->
            return labels.sort()
      else
        console.error "Invalid direction: " + direction


`export default HierarchyElementComponent`
