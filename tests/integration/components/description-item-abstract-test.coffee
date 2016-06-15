`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'description-item-abstract', 'Integration | Component | description item abstract', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{description-item-abstract}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#description-item-abstract}}
      template block text
    {{/description-item-abstract}}
  """

  assert.equal @$().text().trim(), 'template block text'
