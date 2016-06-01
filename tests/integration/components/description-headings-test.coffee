`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'description-headings', 'Integration | Component | description headings', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{description-headings}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#description-headings}}
      template block text
    {{/description-headings}}
  """

  assert.equal @$().text().trim(), 'template block text'
