`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'concept-description/heading', 'Integration | Component | concept description/heading', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{concept-description/heading}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#concept-description/heading}}
      template block text
    {{/concept-description/heading}}
  """

  assert.equal @$().text().trim(), 'template block text'
