`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'popup-content-result', 'Integration | Component | popup content result', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{popup-content-result}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#popup-content-result}}
      template block text
    {{/popup-content-result}}
  """

  assert.equal @$().text().trim(), 'template block text'
