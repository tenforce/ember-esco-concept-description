`import Ember from 'ember'`
`import layout from '../../templates/components/concept-description/heading'`

ConceptDescriptionHeadingComponent = Ember.Component.extend(
  layout
  title: Ember.computed.alias 'heading.title'
  items: Ember.computed 'heading.items', ->
    if @get('heading.items') then @get('heading.items')
    else []
)

`export default ConceptDescriptionHeadingComponent`
