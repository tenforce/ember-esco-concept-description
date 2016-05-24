`import Ember from 'ember'`
`import layout from '../templates/components/test-component'`

TestComponentComponent = Ember.Component.extend
  layout: layout
  value: Ember.computed 'concept', 'model', ->
    @get('concept').get('defaultPrefLabel')

`export default TestComponentComponent`
