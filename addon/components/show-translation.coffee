`import Ember from 'ember'`
`import layout from '../templates/components/show-translation'`

ShowTranslationComponent = Ember.Component.extend
  layout: layout
  properties: Ember.computed.alias 'model.properties'
  defaultLang: Ember.computed.alias 'properties.defaultLang'


`export default ShowTranslationComponent`
