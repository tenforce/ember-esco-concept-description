`import Ember from 'ember'`
`import layout from '../../templates/components/concept-description/title'`

ConceptDescriptionTitleComponent = Ember.Component.extend(
  layout
  title: Ember.computed.alias 'title.title'
  type: Ember.computed.alias 'title.type'
  name: Ember.computed.alias 'title.name'
  component: Ember.computed.alias 'title.component'
  tagName: Ember.computed 'title.tagName', ->
    if @get('title.tagName') then @get('title.tagName')
    else ''
  className: Ember.computed 'title.className', ->
    if @get('title.className') then @get('item.className')
    else ''
)

`export default ConceptDescriptionTitleComponent`
