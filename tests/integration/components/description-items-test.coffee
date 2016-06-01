`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'description-items', 'Integration | Component | description items', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{description-items}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#description-items}}
      template block text
    {{/description-items}}
  """

  assert.equal @$().text().trim(), 'template block text'
