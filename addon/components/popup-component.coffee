`import Ember from 'ember'`
`import layout from '../templates/components/popup-component'`
`import ClickElsewhereMixin from '../mixins/click-elsewhere'`
`import pagedArray from 'ember-cli-pagination/computed/paged-array'`

PopupComponentComponent = Ember.Component.extend ClickElsewhereMixin,
  layout:layout
  displayPopup: false
  store: Ember.inject.service('store')
  filter: ''
  page: 1
  perPage: 15
  totalPagesBinding: "pagedContent.totalPages"
  searchResults: []

  displayPagination: Ember.computed ->
    if @get('searchResults').length > @perPage then true else false
  pagedContent: pagedArray('searchResults',{pageBinding: "page", perPageBinding: "perPage"})
  numberOfResults: Ember.computed 'searchResults', ->
    if @get('searchResults')
      return @get('searchResults').length
    return 0

  onClickElsewhere: ->
    if @get 'displayPopup'
      @toggleProperty 'displayPopup'


  performSearch: ->
    store = @get('store')

    @_getSearchResults(@get('filter')).then (data) =>
      searchOrigin = @get('conceptScheme')
      filtered = data.filter (element) =>
        if element?.attributes?.type?.indexOf(searchOrigin) >= 0 then return true
        else return false
      filtered.sort (a,b) ->
        if(a?.attributes?.score > b?.attributes?.score)
          return -1
        else
          if(b?.attributes?.score > a?.attributes?.score)
            return 1
          else
            return 0

      ids = filtered.map (item) ->
        item.id

      @get('store').query('concept',
      filter: {id: ids.join(',')}
      include: "pref-labels"
      ).then (items) =>
        idMap = {}
        items.map (item) ->
          idMap[item.get('id')] = item
        orderedItems = []
        ids.map (id) ->
          if idMap[id]
            orderedItems.push idMap[id]
        @set 'searchResults', orderedItems

      error: ->
        @set 'searchResults', Ember.A()

  _getSearchResults: (query) ->
    promises = []
    promises.push Ember.$.ajax
      url: '/indexer/search/similar',
      type: 'GET',
      data: {
        'conceptScheme': @get('conceptScheme'),
        'locale': "en",
        'text': query,
        'numberOfResults': "100"
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
    togglePopup: ->
      unless @get 'displayPopup'
        @set('searchResults',[])
        @set('filter','')
      @toggleProperty 'displayPopup'
      false

    textContentModified: (event) ->
      @set 'filter', event.target.value
      if(event.keyCode == 13 && not event.shiftKey)
        if @get 'filter'
          @performSearch()

    filterConcepts: ->
      @get('store').filter 'concept', (concept) =>
        return (concept.get('defaultPrefLabel').indexOf(@get('filter')) >= 0)


`export default PopupComponentComponent`
