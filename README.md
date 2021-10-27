# The "meta way": On upper ontologies and data meshes

This repository accompanies the LinkedIn article [The "meta way"](https://www.linkedin.com/pulse/meta-way-upper-ontologies-data-meshes-andreas-thalhammer/).

The data folder contains the upper ontology and the depicted parts of the KRR and AII products as RDF files.

Following are some queries:

## Counting the number of classes per data product
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl#>

SELECT ?prod ?upperClass (COUNT(?upperClass) AS ?count)  
FROM <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl> 
FROM <https://github.com/kidehen/meta-way/blob/main/data/krr.ttl> 
FROM <https://github.com/kidehen/meta-way/blob/main/data/aii.ttl>

WHERE {
        ?s rdfs:subClassOf+ ?upperClass .
        ?s rdfs:isDefinedBy ?prod.
        VALUES ?upperClass {:Unit :Food} 
} 
GROUP BY ?prod ?upperClass
```
|prod                    |upperClass                             |count|
|------------------------|---------------------------------------|-----|
|https://aii.example.com/|https://upper-ontology.example.com/Unit|3    |
|https://krr.example.com/|https://upper-ontology.example.com/Unit|3    |
|https://krr.example.com/|https://upper-ontology.example.com/Food|3    |
|https://aii.example.com/|https://upper-ontology.example.com/Food|7    |

* [Live Query Results Page](http://linkeddata.uriburner.com/sparql/?default-graph-uri=&query=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+%3A+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%23%3E%0D%0A%0D%0ASELECT+%3Fprod+%3FupperClass+%28COUNT%28%3FupperClass%29+AS+%3Fcount%29++%0D%0AFROM+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Fkrr.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Faii.ttl%3E%0D%0A%0D%0AWHERE+%7B%0D%0A++++++++%3Fs+rdfs%3AsubClassOf%2B+%3FupperClass+.%0D%0A++++++++%3Fs+rdfs%3AisDefinedBy+%3Fprod.%0D%0A++++++++VALUES+%3FupperClass+%7B%3AUnit+%3AFood%7D+%0D%0A%7D+%0D%0AGROUP+BY+%3Fprod+%3FupperClass&should-sponge=&format=text%2Fx-html%2Btr&timeout=30000000)
* [Live Query Editor Page](http://linkeddata.uriburner.com/sparql/?default-graph-uri=&qtxt=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+%3A+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%23%3E%0D%0A%0D%0ASELECT+%3Fprod+%3FupperClass+%28COUNT%28%3FupperClass%29+AS+%3Fcount%29++%0D%0AFROM+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Fkrr.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Faii.ttl%3E%0D%0A%0D%0AWHERE+%7B%0D%0A++++++++%3Fs+rdfs%3AsubClassOf%2B+%3FupperClass+.%0D%0A++++++++%3Fs+rdfs%3AisDefinedBy+%3Fprod.%0D%0A++++++++VALUES+%3FupperClass+%7B%3AUnit+%3AFood%7D+%0D%0A%7D+%0D%0AGROUP+BY+%3Fprod+%3FupperClass&should-sponge=&format=text%2Fx-html%2Btr&timeout=30000000)
## Scrambled eggs with olive oil (extra virgin) and sea salt. 
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX krr: <https://krr.example.com/>
PREFIX : <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl#>

SELECT DISTINCT * 
FROM <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl> 
FROM <https://github.com/kidehen/meta-way/blob/main/data/krr.ttl> 
FROM <https://github.com/kidehen/meta-way/blob/main/data/aii.ttl>
WHERE {
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

* [Live Query Results Page](http://linkeddata.uriburner.com/sparql/?default-graph-uri=&query=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+krr%3A+%3Chttps%3A%2F%2Fkrr.example.com%2F%3E%0D%0APREFIX+%3A+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%23%3E%0D%0A%0D%0ASELECT+DISTINCT+*+%0D%0AFROM+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Fkrr.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Faii.ttl%3E%0D%0AWHERE+%7B%0D%0A++++++++%3Fs+krr%3Ayee3zei8+krr%3Aootafai8i+.%0D%0A++++++++%3Fs+%3Fp+%3Fo++.%0D%0A++++++++OPTIONAL+%7B%3Fp+rdfs%3Alabel+%3FpredicateLabel.%7D%0D%0A++++++++OPTIONAL+%7B%3Fo+rdfs%3Alabel+%3FobjectLabel%7D%0D%0A+++++%7D&should-sponge=&format=text%2Fx-html%2Btr&timeout=30000000)
* [Live Query Editor Page](http://linkeddata.uriburner.com/sparql/?default-graph-uri=&qtxt=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+krr%3A+%3Chttps%3A%2F%2Fkrr.example.com%2F%3E%0D%0APREFIX+%3A+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%23%3E%0D%0A%0D%0ASELECT+DISTINCT+*+%0D%0AFROM+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Fkrr.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Faii.ttl%3E%0D%0AWHERE+%7B%0D%0A++++++++%3Fs+krr%3Ayee3zei8+krr%3Aootafai8i+.%0D%0A++++++++%3Fs+%3Fp+%3Fo++.%0D%0A++++++++OPTIONAL+%7B%3Fp+rdfs%3Alabel+%3FpredicateLabel.%7D%0D%0A++++++++OPTIONAL+%7B%3Fo+rdfs%3Alabel+%3FobjectLabel%7D%0D%0A+++++%7D&should-sponge=&format=text%2Fx-html%2Btr&timeout=30000000)
## Fridge and shelf of Alice
```
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX aii: <https://aii.example.com/>

SELECT DISTINCT * 
FROM <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl> 
FROM <https://github.com/kidehen/meta-way/blob/main/data/krr.ttl> 
FROM <https://github.com/kidehen/meta-way/blob/main/data/aii.ttl>
WHERE {
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

* [Live Query Results Page](http://linkeddata.uriburner.com/sparql/?default-graph-uri=&query=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+%3A+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0Aprefix+aii%3A+%3Chttps%3A%2F%2Faii.example.com%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+*+%0D%0AFROM+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Fkrr.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Faii.ttl%3E%0D%0AWHERE+%7B%0D%0A++++++++%3Fs+aii%3Aahch9aix+aii%3Apah7chae+.%0D%0A++++++++%3Fs+%3Fp+%3Fo++.%0D%0A++++++++OPTIONAL+%7B%3Fp+rdfs%3Alabel+%3FpredicateLabel.%7D%0D%0A++++++++OPTIONAL+%7B%3Fo+rdfs%3Alabel+%3FobjectLabel%7D%0D%0A%7D+&should-sponge=&format=text%2Fx-html%2Btr&timeout=30000000)
* [Live Query Editor Page](http://linkeddata.uriburner.com/sparql/?default-graph-uri=&qtxt=PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+%3A+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0Aprefix+aii%3A+%3Chttps%3A%2F%2Faii.example.com%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+*+%0D%0AFROM+%3Chttps%3A%2F%2Fraw.githubusercontent.com%2Fkidehen%2Fmeta-way%2Fmain%2Fdata%2Fupper-ontology.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Fkrr.ttl%3E+%0D%0AFROM+%3Chttps%3A%2F%2Fgithub.com%2Fkidehen%2Fmeta-way%2Fblob%2Fmain%2Fdata%2Faii.ttl%3E%0D%0AWHERE+%7B%0D%0A++++++++%3Fs+aii%3Aahch9aix+aii%3Apah7chae+.%0D%0A++++++++%3Fs+%3Fp+%3Fo++.%0D%0A++++++++OPTIONAL+%7B%3Fp+rdfs%3Alabel+%3FpredicateLabel.%7D%0D%0A++++++++OPTIONAL+%7B%3Fo+rdfs%3Alabel+%3FobjectLabel%7D%0D%0A%7D+&should-sponge=&format=text%2Fx-html%2Btr&timeout=30000000)
