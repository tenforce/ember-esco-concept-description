`import Ember from 'ember'`
`import layout from '../templates/components/term-list'`

TermListComponent = Ember.Component.extend
  layout: layout
  properties: Ember.computed.alias 'model.properties'
  targetLanguage: Ember.computed.alias 'properties.targetLanguage'

`export default TermListComponent`
