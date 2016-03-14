import Relation from './mixins/esco-concept-relation';
import Concept from './mixins/esco-concept';
import Label from './mixins/esco-label';
import LabelRole from './mixins/esco-label-role';
import Taxonomy from './mixins/esco-taxonomy';

var ESCODescription = function () {
  this.Relation = Relation;
  this.Concept = Concept;
  this.Label = Label;
  this.LabelRole = LabelRole;
  this.Taxonomy = Taxonomy;
};

var escoDescription = new ESCODescription();

export { Relation, Concept, Label, LabelRole, Taxonomy };
export default escoDescription;
