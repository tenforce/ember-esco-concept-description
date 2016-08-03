# Ember-esco-concept-description

An ember component to display a esco concept
You can call it in templates this way
{{concept-description concept=concept config=conceptDescription}}
With concept being the object you want to describe and config being the JSON configuration file.

Notes : 
- classNames and tagNames are optional 
- items (and titles) must have a target but the label is optional
- you can specify a classNames and a tagName for almost all elements
- the accepted type for labels is "string" though other types might work (but if they don't it won't be changed)
- the accepted types for targets are "string", "property", "component", "hasOne", "hasMany"
- empty items and headings will be hidden. It might be possible to force them to show in a next update.
- if a custom made component is empty and needs to be hidden, it has to send a "emptyComponent" action
- custom components will receive the concept, and any parameters specified in the JSON

On a heading and item level, you can also specify something to display in case the inner component is empty. 
  displayEmpty:
    target:
      type: 'string'
      name: 'None'

An example of JSON configuration file (in coffeescript):
conceptDescription:
    title:
      classNames: ['header']
      tagName: 'div'
      label:
        classNames: ['header-label']
        tagName: 'div'
        type: 'string'
        name: 'Concept : '
      target:
        classNames: ['header-target']
        tagName: 'div'
        type: 'property'
        name: 'defaultPrefLabel'
    ,
    headings:
      classNames: ['concept headings']
      tagName: 'div'
      values:
        [
          {
            classNames: ['concept-info heading']
            tagName: 'div'
            title:
              classNames: ['concept-info']
              tagName: 'div'
              target:
                type: 'string'
                name: 'Concept info'
            items:
              values:
                [
                  {
                    classNames: ['description']
                    tagName: 'div'
                    label:
                      type: 'string'
                      name: 'description'
                    target:
                      type: 'property'
                      name: 'defaultDescription'
                  },
                  {
                    classNames: ['non-preferred terms']
                    tagName: 'div'
                    label:
                      type: 'string'
                      name: 'Non-preferred terms'
                    target:
                      type: 'hasMany'
                      name: 'defaultHiddenLabels'
                      relation:
                        type: 'property'
                        name: 'literalForm'
                  }
                ]
          },
          {
            classNames: ['concept-skills heading']
            tagName: 'div'
            displayEmpty:
              target:
                type: 'string'
                name: 'None'
            title:
              classNames: ['concept-skills']
              tagName: 'div'
              target:
                type: 'string'
                name: 'Related skills / competences'
            items:
              values:
                [
                  {
                    displayEmpty:
                      target:
                        type: 'string'
                        name: 'None'
                    label:
                      type: 'string'
                      name: 'Essential skills'
                    target:
                      type:'hasMany'
                      name:'essentialSkills'
                      relation:
                        type: 'property'
                        name: 'defaultPrefLabel'
                  }
                ]
          }
        ]

## Usage
ember install git+ssh://git@git.tenforce.com:esco/ember-esco-concept-description.git
