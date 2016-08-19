`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'hierarchy-element', 'Integration | Component | hierarchy element', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{hierarchy-element}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#hierarchy-element}}
      template block text
    {{/hierarchy-element}}
  """

  assert.equal @$().text().trim(), 'template block text'
