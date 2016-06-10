`import Ember from 'ember'`

NodeValueMixin = Ember.Mixin.create
  ensurePromise: (x) ->
    return new Ember.RSVP.Promise (resolve) ->
      resolve(x)
  value: Ember.computed 'concept', 'type', 'name', ->
    res
    if ['string', 'component'].contains(@get('type'))
      res = @get('name')
    else if ['property', 'hasMany', 'hasOne'].contains(@get('type'))
      res = @getProperty(@get('concept'), @get('name'))
    @ensurePromise(res)

  getProperty: (target, propertyName) ->
    if target then target.get(propertyName)
    else return null

`export default NodeValueMixin`
