SPARQL CLEAR GRAPH <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl> ;
SPARQL CLEAR GRAPH <https://github.com/kidehen/meta-way/blob/main/data/krr.ttl> ;
SPARQL CLEAR GRAPH <https://github.com/kidehen/meta-way/blob/main/data/aii.ttl> ;

SPARQL
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl#>

INSERT DATA {
                GRAPH <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl> 
                    {
                        :Food a rdfs:Class ;
                            rdfs:label "Food" .
                        :Unit a rdfs:Class ;
                            rdfs:label "Unit" .
                        :hasUnit a rdf:Property ;
                            rdfs:label "has unit" ;
                            rdfs:domain :Food ;
                            rdfs:range :Unit . 
                    }
            } ;

SPARQL
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX krr: <https://krr.example.com/>
PREFIX : <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl#>

INSERT DATA {
                GRAPH <https://github.com/kidehen/meta-way/blob/main/data/krr.ttl> {
                krr:yei4ha8j a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:subClassOf :Food ;
                    rdfs:label "Salt" .

                krr:thutal0u a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:subClassOf :Food ;
                    rdfs:label "Egg" .
                    
                krr:ohdae5a a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:subClassOf :Food ;
                    rdfs:label "Olive oil" .

                krr:thie2en a rdf:Property ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:label "origin" .

                krr:rueth0du a rdf:Property ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:label "quality" .

                krr:joow8vou a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:label "Sea" .

                krr:teingee9 a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:subClassOf krr:ahg7aesh ;
                    rdfs:label "Extra Virgin" .

                krr:ahg7aesh a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:label "Virgin" .

                krr:aew8if5i a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:subClassOf :Unit ;
                    rdfs:label "Count" .
                    
                krr:eich9ahbi a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:subClassOf :Unit ;
                    rdfs:label "Tea Spoon" .

                krr:uw8feu2ji a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:subClassOf :Unit ;
                    rdfs:label "Gram" .

                krr:oong2oogi a rdfs:Class ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:label "Recipe" .

                krr:yee3zei8 a rdf:Property ;
                    rdfs:isDefinedBy <https://krr.example.com/> ;
                    rdfs:label "ingredient of" ;
                    rdfs:domain :Food ;
                    rdfs:range krr:oong2oogi .

                krr:ootafai8i a krr:oong2oogi ;
                    rdfs:label "Scrambled eggs with olive oil (extra virgin) and sea salt" .

                krr:seoqu4vi a krr:thutal0u ;
                    krr:yee3zei8 krr:ootafai8i ;
                    rdfs:label "Recipe Eggs" ; # for visualization purposes
                    :hasUnit krr:aew8if5i ;
                    rdf:value 3 .

                krr:uoleith3a a krr:yei4ha8j ;
                    krr:yee3zei8 krr:ootafai8i ;
                    rdfs:label "Recipe Salt" ; # for visualization purposes
                    :hasUnit krr:eich9ahbi ;
                    rdf:value 1 ;
                    krr:thie2en krr:joow8vou .

                krr:iezi0oht a krr:ohdae5a ;
                    krr:yee3zei8 krr:ootafai8i ;
                    rdfs:label "Recipe Olive Oil" ; # for visualization purposes
                    :hasUnit krr:uw8feu2ji ;
                    rdf:value 10 ;
                    krr:rueth0du krr:teingee9 .
                }
                } ;

                sparql
                PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                PREFIX krr: <https://krr.example.com/>
                PREFIX aii: <https://aii.example.com/>
                PREFIX : <https://raw.githubusercontent.com/kidehen/meta-way/main/data/upper-ontology.ttl#>

                INSERT DATA {
                GRAPH <https://github.com/kidehen/meta-way/blob/main/data/aii.ttl> {
                aii:gei4ju1n a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf :Food ;
                    rdfs:label "Salt" .

                aii:gek3oepa a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf :Food ;
                    rdfs:label "Egg" .

                aii:ohhae0ie a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf :Food ;
                    rdfs:label "Olive oil" .

                aii:io6eeyoh a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf aii:gek3oepa ;
                    rdfs:label "Free Range Egg" .

                aii:eizoh2so a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf aii:gei4ju1n ;
                    rdfs:label "Sea Salt" .

                aii:nei6aeth a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf aii:ohhae0ie ;
                    rdfs:label "Olive Oil (virgin)" .

                aii:hohchae4 a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf aii:nei6aeth ;
                    rdfs:label "Olive Oil (extra virgin)" .

                aii:utu4eihia a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf :Unit ;
                    rdfs:label "Count" .

                aii:eegh6vuy a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf :Unit ;
                    rdfs:label "Kilo Gram" .

                aii:eer4kooh a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:subClassOf :Unit ;
                    rdfs:label "Litre" .

                aii:esahj3ju a rdf:Property ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:domain :Food ;
                    rdfs:label "expiry date" .

                aii:ahch9aix a rdf:Property ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:domain :Food ;
                    rdfs:range aii:tei2jeez ;
                    rdfs:label "customer" .

                aii:tei2jeez a rdfs:Class ;
                    rdfs:isDefinedBy <https://aii.example.com/> ;
                    rdfs:label "Customer account" .
                    
                aii:pah7chae a aii:tei2jeez ;
                    rdfs:label "Alice" . # for visualization purposes

                aii:eighe8th a aii:io6eeyoh ;
                    rdfs:label "Alice's Eggs" ; # for visualization purposes
                    aii:ahch9aix aii:pah7chae ;
                    aii:esahj3ju "2021-20-21"^^xsd:date ;
                    :hasUnit aii:utu4eihia ;
                    rdf:value 10 .

                aii:deegho6c a aii:eizoh2so ;
                    rdfs:label "Alice's Salt" ; # for visualization purposes
                    aii:ahch9aix aii:pah7chae ;
                    :hasUnit aii:eegh6vuy ;
                    rdf:value 1 .

                aii:gee8ovee a aii:hohchae4 ;
                    rdfs:label "Alice's Oil" ; # for visualization purposes
                    aii:ahch9aix aii:pah7chae ;
                    aii:esahj3ju "2022-03-10"^^xsd:date ;
                    :hasUnit aii:eer4kooh ;
                    rdf:value 1 .
            }
} ;


SPARQL
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
