`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

EscoLabelMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  literalFormValues: DS.attr('lang-string-set')
  roles: DS.hasMany('label-role')

  literalFormObject: Ember.computed 'literalFormValues', 'literalFormValues.firstObject',
    get: (key) ->
      @get('literalFormValues.firstObject')
    set: (key, value) ->
      @set('literalFormValues.firstObject', value)
      return value

  literalForm: Ember.computed 'literalFormObject', 'literalFormObject.content',
    get: (key) ->
      @get('literalFormObject.content')
    set: (key, value) ->
      if @get('literalFormObject') is undefined then @set('literalFormObject', {content: "", language: ""})
      @set('literalFormObject.content', value)
      return value

  language: Ember.computed 'literalFormObject', 'literalFormObject.language',
    get: (key) ->
      @get('literalFormObject.language')
    set: (key, value) ->
      if @get('literalFormObject') is undefined then @set('literalFormObject', {content: "", language: ""})
      @set('literalFormObject.language', value)
      return value

  # genders
  genders: Ember.computed.mapBy 'roles', 'preflabel'
  neutral: Ember.computed  'genders', ->
    @get('genders')?.contains('neutral')
  female: Ember.computed 'genders', ->
    @get('genders')?.contains('female')
  male: Ember.computed 'genders', ->
    @get('genders')?.contains('male')
  preferredMale: Ember.computed 'genders',  ->
    @get('genders')?.contains('standard male term')
  preferredFemale: Ember.computed 'genders',  ->
    @get('genders')?.contains('standard female term')

  hasGender: (prefLabel) ->
    @get('genders')?.contains(prefLabel)

  hasRole: (role) ->
    @get('roles').then (roles) ->
      return roles.contains(role)
  # modifiers
  setRole: (role, isActive) ->
    @get('roles').then (roles) =>
      if isActive
        roles.pushObject(role)
      else
        roles.removeObject(role)
  toggleRole: (role) ->
    new Ember.RSVP.Promise (resolve, reject) =>
      success =   =>
        if @get('roles').contains(role)
          @get('roles').removeObject(role)
        else
          @get('roles').addObject(role)
        resolve()
      failure = (err) ->
        reject(err)
      @get('roles').then(success,failure)


`export default EscoLabelMixin`
