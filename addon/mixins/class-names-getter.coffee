`import Ember from 'ember'`

ClassNamesGetterMixin = Ember.Mixin.create
  getClassNames: Ember.computed 'pClassNames', 'model.classNames', ->
    if @get('pClassNames') then @get('pClassNames')
    else if @get('model.classNames') then @get('model.classNames')
    else @get('defaultClassNames')

  classNameBindings:['getClassNames']

`export default ClassNamesGetterMixin`
