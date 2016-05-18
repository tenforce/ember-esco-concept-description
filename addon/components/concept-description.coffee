`import Ember from 'ember'`
`import layout from '../templates/components/concept-description'`

ConceptDescriptionComponent = Ember.Component.extend
  layout: layout
  title: Ember.computed.alias "config.title"
  headings: Ember.computed.alias "config.headings"
  tagName: Ember.computed 'config.tagName', ->
    if @get('config.tagName') then @get('config.tagName')
    else ''
  className: Ember.computed 'config.className', ->
    if @get('config.className') then @get('config.className')
    else ''

`export default ConceptDescriptionComponent`
