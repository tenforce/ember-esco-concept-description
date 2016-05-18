`import Ember from 'ember'`
`import layout from '../templates/components/concept-description'`

ConceptDescriptionComponent = Ember.Component.extend(
  layout
  title: Ember.computed.alias "concept-description.title"
  headings: Ember.computed.alias "concept-description.headings"
  tagName: Ember.computed 'concept-description.tagName', ->
    if @get('concept-description.tagName') then @get('concept-description.tagName')
    else ''
  className: Ember.computed 'concept-description.className', ->
    if @get('concept-description.className') then @get('concept-description.className')
    else ''
)

`export default ConceptDescriptionComponent`
