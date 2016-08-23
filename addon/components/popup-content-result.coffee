`import Ember from 'ember'`
`import layout from '../templates/components/popup-content-result'`
`import pagedArray from 'ember-cli-pagination/computed/paged-array'`

PopupContentResultComponent = Ember.Component.extend
  layout: layout
  page: 1
  perPage: 15

  displayPagination: Ember.computed ->
    if @get('searchResults').length > @perPage then true else false

  pagedContent: pagedArray('searchResults',{pageBinding: "page", perPageBinding: "perPage"})

  totalPagesBinding: "pagedContent.totalPages"

  numberOfResults: Ember.computed 'searchResults', ->
    return @get('searchResults').length



`export default PopupContentResultComponent`
