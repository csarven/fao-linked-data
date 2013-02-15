#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

data="/data/fao-linked-data/data/";
namespace="http://fao.270a.info/";
db="/SSD/data/tdb/db/fao/";
tdbAssembler="/usr/lib/fuseki/tdb.fao.ttl";
JVM_ARGS="-Xmx12000M"
void="/var/www/fao.270a.info/void.ttl";

./fao.drop.graph.void.sh

echo Importing LODStats into "$namespace"graph/void ;
for i in "$data"import/*stats.ttl ; do java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/void "$i"; done ;

./fao.construct.void.sh

./fao.drop.graph.void.sh

echo Inserting "$void" back into "$namespace"graph/void ;
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/void "$void"

