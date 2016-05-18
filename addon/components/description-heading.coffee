`import Ember from 'ember'`
`import layout from '../templates/components/description-heading'`

DescriptionHeadingComponent = Ember.Component.extend
  layout: layout
  title: Ember.computed.alias 'heading.title'
  items: Ember.computed 'heading.items', ->
    if @get('heading.items') then @get('heading.items')
    else []

`export default DescriptionHeadingComponent`
