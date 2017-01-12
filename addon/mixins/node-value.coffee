`import Ember from 'ember'`

NodeValueMixin = Ember.Mixin.create
  ensurePromise: (x) ->
    return new Ember.RSVP.Promise (resolve) ->
      resolve(x)

  setValue: Ember.observer('concept', 'name', 'type', () ->
    if ['string', 'component'].contains(@get('type'))
      Ember.defineProperty @, "value",
        Ember.computed 'concept', 'type', 'name', ->
          @ensurePromise(@get('name'))
    else
      key = "concept."+@get('name')
      Ember.defineProperty @, "value",
        Ember.computed 'concept', 'name', 'type', key, ->
          res
          if ['property', 'hasMany', 'hasOne'].contains(@get('type'))
            res = @getProperty(@get('concept'), @get('name'))
          @ensurePromise(res)
  ).on('init')

  getProperty: (target, propertyName) ->
    if target then target.get(propertyName)
    else return null

`export default NodeValueMixin`
