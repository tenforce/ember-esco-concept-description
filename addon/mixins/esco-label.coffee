`import Ember from 'ember'`
`import DS from 'ember-data'`
`import HasManyQuery from 'ember-data-has-many-query'`

EscoLabelMixin = Ember.Mixin.create HasManyQuery.ModelMixin,
  prefLabelOf: DS.belongsTo('concept', inverse: "prefLabels")
  altLabelOf: DS.hasMany('concept', inverse: "altLabels")
  hiddenLabelOf: DS.hasMany('concept', inverse: "hiddenLabels")
  literalFormValues: DS.attr('lang-string-set')
  roles: DS.hasMany('label-role')

  # for esco labels have only one literalForm
  literalForm: Ember.computed 'literalFormValues', ->
    @get('literalFormValues.firstObject.content')
  language: Ember.computed 'literalFormValues', ->
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
    if isActive
      @get('roles').then =>
        @get('roles').pushObject(role)
    else
      @get('roles').removeObject(role)
  toggleGender: (role) ->
    @get('roles').then =>
      if @get('roles').contains(role)
        @get('roles').removeObject(role)
      else
        @get('roles').addObject(role)


`export default EscoLabelMixin`
