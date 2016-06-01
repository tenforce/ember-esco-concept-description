`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'concept-description/title', 'Integration | Component | concept description/title', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{concept-description/title}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#concept-description/title}}
      template block text
    {{/concept-description/title}}
  """

  assert.equal @$().text().trim(), 'template block text'
