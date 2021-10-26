# The "meta way": On upper ontologies and data meshes

This repository accompanies the LinkedIn article [The "meta way"](https://www.linkedin.com/pulse/meta-way-upper-ontologies-data-meshes-andreas-thalhammer/).

The data folder contains the upper ontology and the depicted parts of the KRR and AII products as RDF files.

Following are some queries:

## Counting the number of classes per data product
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foo: <https://upper-ontology.example.com/>
SELECT ?prod ?upperClass (COUNT(?upperClass) AS ?count)  WHERE {
  ?s rdfs:subClassOf+ ?upperClass .
  ?s rdfs:isDefinedBy ?prod.
  VALUES ?upperClass {
    foo:Unit
    foo:Food
  } 
} GROUP BY ?prod ?upperClass
```
|prod                    |upperClass                             |count|
|------------------------|---------------------------------------|-----|
|https://aii.example.com/|https://upper-ontology.example.com/Unit|3    |
|https://krr.example.com/|https://upper-ontology.example.com/Unit|3    |
|https://krr.example.com/|https://upper-ontology.example.com/Food|3    |
|https://aii.example.com/|https://upper-ontology.example.com/Food|7    |

## Scrambled eggs with olive oil (extra virgin) and sea salt.
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foo: <https://upper-ontology.example.com/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX krr: <https://krr.example.com/>

SELECT * WHERE {
?s krr:yee3zei8 krr:ootafai8i .
?s ?p ?o  .
  OPTIONAL {?p rdfs:label ?predicateLabel.}
  OPTIONAL {?o rdfs:label ?objectLabel}
}
```
|s                                |p                                               |o                                |predicateLabel|objectLabel                                              |FIELD6|
|---------------------------------|------------------------------------------------|---------------------------------|--------------|---------------------------------------------------------|------|
|https://krr.example.com/uoleith3a|https://upper-ontology.example.com/hasUnit      |https://krr.example.com/eich9ahbi|has unit      |Tea Spoon                                                |      |
|https://krr.example.com/uoleith3a|https://krr.example.com/thie2en                 |https://krr.example.com/joow8vou |origin        |Sea                                                      |      |
|https://krr.example.com/uoleith3a|http://www.w3.org/1999/02/22-rdf-syntax-ns#type |https://krr.example.com/yei4ha8j |type          |Salt                                                     |      |
|https://krr.example.com/uoleith3a|https://krr.example.com/yee3zei8                |https://krr.example.com/ootafai8i|ingredient of |Scrambled eggs with olive oil (extra virgin) and sea salt|      |
|https://krr.example.com/uoleith3a|http://www.w3.org/1999/02/22-rdf-syntax-ns#value|1                                |value         |                                                         |      |
|https://krr.example.com/uoleith3a|http://www.w3.org/2000/01/rdf-schema#label      |Recipe Salt                      |              |                                                         |      |
|https://krr.example.com/iezi0oht |https://upper-ontology.example.com/hasUnit      |https://krr.example.com/uw8feu2ji|has unit      |Gram                                                     |      |
|https://krr.example.com/iezi0oht |http://www.w3.org/1999/02/22-rdf-syntax-ns#type |https://krr.example.com/ohdae5a  |type          |Olive oil                                                |      |
|https://krr.example.com/iezi0oht |https://krr.example.com/yee3zei8                |https://krr.example.com/ootafai8i|ingredient of |Scrambled eggs with olive oil (extra virgin) and sea salt|      |
|https://krr.example.com/iezi0oht |https://krr.example.com/rueth0du                |https://krr.example.com/teingee9 |quality       |Extra Virgin                                             |      |
|https://krr.example.com/iezi0oht |http://www.w3.org/1999/02/22-rdf-syntax-ns#value|10                               |value         |                                                         |      |
|https://krr.example.com/iezi0oht |http://www.w3.org/2000/01/rdf-schema#label      |Recipe Olive Oil                 |              |                                                         |      |
|https://krr.example.com/seoqu4vi |https://upper-ontology.example.com/hasUnit      |https://krr.example.com/aew8if5i |has unit      |Count                                                    |      |
|https://krr.example.com/seoqu4vi |http://www.w3.org/1999/02/22-rdf-syntax-ns#type |https://krr.example.com/thutal0u |type          |Egg                                                      |      |
|https://krr.example.com/seoqu4vi |https://krr.example.com/yee3zei8                |https://krr.example.com/ootafai8i|ingredient of |Scrambled eggs with olive oil (extra virgin) and sea salt|      |
|https://krr.example.com/seoqu4vi |http://www.w3.org/1999/02/22-rdf-syntax-ns#value|3                                |value         |                                                         |      |
|https://krr.example.com/seoqu4vi |http://www.w3.org/2000/01/rdf-schema#label      |Recipe Eggs                      |              |                                                         |      |

## Fridge and shelf of Alice
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foo: <https://upper-ontology.example.com/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
prefix aii: <https://aii.example.com/>

SELECT * WHERE {
?s aii:ahch9aix aii:pah7chae .
?s ?p ?o  .
  OPTIONAL {?p rdfs:label ?predicateLabel.}
  OPTIONAL {?o rdfs:label ?objectLabel}
}
```
|s                               |p                                               |o                                |predicateLabel|objectLabel             |
|--------------------------------|------------------------------------------------|---------------------------------|--------------|------------------------|
|https://aii.example.com/eighe8th|https://aii.example.com/ahch9aix                |https://aii.example.com/pah7chae |customer      |Alice                   |
|https://aii.example.com/eighe8th|https://upper-ontology.example.com/hasUnit      |https://aii.example.com/utu4eihia|has unit      |Count                   |
|https://aii.example.com/eighe8th|http://www.w3.org/1999/02/22-rdf-syntax-ns#type |https://aii.example.com/io6eeyoh |type          |Free Range Egg          |
|https://aii.example.com/eighe8th|http://www.w3.org/1999/02/22-rdf-syntax-ns#value|10                               |value         |                        |
|https://aii.example.com/eighe8th|https://aii.example.com/esahj3ju                |2021-20-21                       |expiry date   |                        |
|https://aii.example.com/eighe8th|http://www.w3.org/2000/01/rdf-schema#label      |Alice's Eggs                     |              |                        |
|https://aii.example.com/gee8ovee|https://aii.example.com/ahch9aix                |https://aii.example.com/pah7chae |customer      |Alice                   |
|https://aii.example.com/gee8ovee|https://upper-ontology.example.com/hasUnit      |https://aii.example.com/eer4kooh |has unit      |Litre                   |
|https://aii.example.com/gee8ovee|http://www.w3.org/1999/02/22-rdf-syntax-ns#type |https://aii.example.com/hohchae4 |type          |Olive Oil (extra virgin)|
|https://aii.example.com/gee8ovee|http://www.w3.org/1999/02/22-rdf-syntax-ns#value|1                                |value         |                        |
|https://aii.example.com/gee8ovee|https://aii.example.com/esahj3ju                |2022-03-10                       |expiry date   |                        |
|https://aii.example.com/gee8ovee|http://www.w3.org/2000/01/rdf-schema#label      |Alice's Oil                      |              |                        |
|https://aii.example.com/deegho6c|https://aii.example.com/ahch9aix                |https://aii.example.com/pah7chae |customer      |Alice                   |
|https://aii.example.com/deegho6c|https://upper-ontology.example.com/hasUnit      |https://aii.example.com/eegh6vuy |has unit      |Kilo Gram               |
|https://aii.example.com/deegho6c|http://www.w3.org/1999/02/22-rdf-syntax-ns#type |https://aii.example.com/eizoh2so |type          |Sea Salt                |
|https://aii.example.com/deegho6c|http://www.w3.org/1999/02/22-rdf-syntax-ns#value|1                                |value         |                        |
|https://aii.example.com/deegho6c|http://www.w3.org/2000/01/rdf-schema#label      |Alice's Salt                     |              |                        |


