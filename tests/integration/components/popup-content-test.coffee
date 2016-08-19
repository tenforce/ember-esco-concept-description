`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'popup-content', 'Integration | Component | popup content', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{popup-content}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#popup-content}}
      template block text
    {{/popup-content}}
  """

  assert.equal @$().text().trim(), 'template block text'
