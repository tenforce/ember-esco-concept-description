`import Ember from 'ember'`
`import EscoConceptSchemeMixin from '../../../mixins/esco-concept-scheme'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | esco concept scheme'

# Replace this with your real tests.
test 'it works', (assert) ->
  EscoConceptSchemeObject = Ember.Object.extend EscoConceptSchemeMixin
  subject = EscoConceptSchemeObject.create()
  assert.ok subject
