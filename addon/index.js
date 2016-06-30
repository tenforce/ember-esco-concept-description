import Relation from './mixins/esco-concept-relation';
import Concept from './mixins/esco-concept';
import Label from './mixins/esco-label';
import LabelRole from './mixins/esco-label-role';
import Structure from './mixins/esco-structure';
import Segment from './mixins/esco-segment';

var ESCODescription = function () {
  this.Relation = Relation;
  this.Concept = Concept;
  this.Label = Label;
  this.LabelRole = LabelRole;
  this.Structure = Structure;
  this.Segment = Segment;
};

var escoDescription = new ESCODescription();

export { Relation, Concept, Label, LabelRole, Structure, Segment };
export default escoDescription;
