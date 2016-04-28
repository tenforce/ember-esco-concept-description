`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

EscoLabelMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  literalFormValues: DS.attr('lang-string-set')
  roles: DS.hasMany('label-role')

  # for esco labels have only one literalForm
  literalForm: Ember.computed 'literalFormValues.firstObject.content', ->
    @get('literalFormValues.firstObject.content')
  language: Ember.computed 'literalFormValues.firstObject.language', ->
    @get('literalFormValues.firstObject.language')
  # genders
  hasRole: (prefLabel) ->
    @get('genders')?.contains(prefLabel)
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

  # modifiers
  setGender: (role, isActive) ->
    new Promise (resolve, reject) =>
      success =   =>
        if isActive
          @get('roles').pushObject(role)
        else
          @get('roles').removeObject(role)
        resolve()
      failure = (err) ->
        reject(err)
      @get('roles').then(success,failure)
  toggleGender: (role) ->
    new Promise (resolve, reject) =>
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
