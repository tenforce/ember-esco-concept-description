`import Ember from 'ember'`
`import EscoPillarMixin from '../../../mixins/esco-pillar'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | esco pillar'

# Replace this with your real tests.
test 'it works', (assert) ->
  EscoPillarObject = Ember.Object.extend EscoPillarMixin
  subject = EscoPillarObject.create()
  assert.ok subject
