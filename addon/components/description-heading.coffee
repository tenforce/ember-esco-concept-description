`import Ember from 'ember'`
`import layout from '../templates/components/description-heading'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

DescriptionHeadingComponent = Ember.Component.extend
  layout: layout

  actions:
    emptyTitle: (item) ->
      @sendAction('emptyTitle', @get('model'))
    emptyItems: (items) ->
      @sendAction('emptyHeading', @get('model'))

`export default DescriptionHeadingComponent`
