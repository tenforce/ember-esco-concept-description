`import Ember from 'ember'`

TagNameGetterMixin = Ember.Mixin.create
  tagName: Ember.computed 'model.tagName', ->
    if @get('model.tagName') then @get('model.tagName')
    else @get('defaultTagName')

`export default TagNameGetterMixin`
