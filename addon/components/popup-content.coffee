`import Ember from 'ember'`
`import layout from '../templates/components/popup-content'`

PopupContentComponent = Ember.Component.extend
  layout: layout
  store: Ember.inject.service('store')
  filter: ''

  performSearch: ->
    store = @get('store')

    @_getSearchResults(@get('filter')).then (data) =>
        @set 'searchResults', data

      error: ->
        @set 'searchResults', Ember.A()

  _getSearchResults: (query) ->
    promises = []
    promises.push Ember.$.ajax
      url: '/indexer/search/autocomplete',
      type: 'GET',
      data: {
        'conceptScheme': @get('conceptScheme'),
        'locale': "en",
        'text': query
      },
      contentType: "application/json",

    Ember.RSVP.all(promises).then((results) =>
      searched = []
      results.map (result) ->
        result.data.map (item) ->
          searched.push item

      seen = {}
      filtered = []
      searched.map (item) ->
        unless seen[item.id]
          seen[item.id] = true
          filtered.push item
      filtered
    ).catch =>
      []

  actions:
    textContentModified: (event) ->
      @set 'filter', event.target.value
      if(event.keyCode == 13 && not event.shiftKey)
        if @get 'filter'
          @performSearch()
        else
          console.log 'yolo'

    filterConcepts: ->
      @get('store').filter 'concept', (concept) =>
        return (concept.get('defaultPrefLabel').indexOf(@get('filter')) >= 0)


`export default PopupContentComponent`
