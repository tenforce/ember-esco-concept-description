`import Ember from 'ember'`
`import layout from '../templates/components/description-headings'`
`import ClassNamesGetterMixin from '../mixins/class-names-getter'`
`import TagNameGetterMixin from '../mixins/tag-name-getter'`

DescriptionHeadingsComponent = Ember.Component.extend ClassNamesGetterMixin, TagNameGetterMixin,
  layout: layout
  headings: Ember.computed.alias 'model.values'

  defaultTagName: 'div'
  defaultClassNames: ['description-headings']

  checkEmpty: Ember.observer('model.values.length', () ->
    unless @get('model.values.length') > 0 then @sendAction('emptyHeadings', @get('model'))
  ).on('init')

  actions:
    emptyHeading: (heading)->
      @get('model.values').removeObject(heading)

`export default DescriptionHeadingsComponent`
