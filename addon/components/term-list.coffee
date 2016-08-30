`import Ember from 'ember'`
`import layout from '../templates/components/term-list'`

TermListComponent = Ember.Component.extend
  layout: layout
  properties: Ember.computed.alias 'model.properties'
  targetLanguage: Ember.computed.alias 'properties.targetLanguage'

  actions:
    goToQuest: (text) ->
      text = escape(text)
      target = escape(@get('targetLanguage')).toUpperCase()
      source = escape('en').toUpperCase()
      url = "https://webgate.ec.testa.eu/questmetasearch/search.php?searchedText=#{text}&selectedSourceLang=#{source}&selectedDestLang=#{target}"
      window.open(url)

`export default TermListComponent`
