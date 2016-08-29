`import Ember from 'ember'`

# This function receives the params `params, hash`
questLinkGenerator = (params) ->
  text = escape(params[0])
  target = escape(params[1]).toUpperCase()
  source = escape('en').toUpperCase()
  "https://webgate.ec.testa.eu/questmetasearch/search.php?searchedText=#{text}&selectedSourceLang=#{source}&selectedDestLang=#{target}"

QuestLinkGeneratorHelper = Ember.Helper.helper questLinkGenerator

`export { questLinkGenerator }`

`export default QuestLinkGeneratorHelper`
