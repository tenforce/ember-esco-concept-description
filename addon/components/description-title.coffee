`import Ember from 'ember'`
`import layout from '../templates/components/description-title'`

DescriptionTitleComponent = Ember.Component.extend
  layout: layout

  tagName: ''
  classNames: ['']

  defaultTagName: 'div'
  defaultClassNames: ['title']

  getTagName: Ember.computed 'pTagName', ->
    if @get('pTagName') then @get('pTagName')
    else @get('defaultTagName')

  getClassNames: Ember.computed 'pClassNames', ->
    if @get('pClassNames') then @get('pClassNames')
    else @get('defaultClassNames')

`export default DescriptionTitleComponent`
