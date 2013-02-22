#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./fao.config.sh

./fao.drop.graph.void.sh

echo Importing LODStats into "$namespace"graph/void ;
for i in "$data"import/*stats.ttl ; do java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/void "$i"; done ;

./fao.construct.void.sh

./fao.drop.graph.void.sh

echo Inserting "$void" back into "$namespace"graph/void ;
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/void "$void"

