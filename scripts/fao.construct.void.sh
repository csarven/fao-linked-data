#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./fao.config.sh

echo Exporting "$namespace"graph/void to "$void" ;
java "$JVM_ARGS" tdb.tdbquery --time --desc="$tdbAssembler" --results=turtle --query="$voidInit" > "$void" ;

#real    0m28.707s
#user    0m37.966s
#sys     0m2.112s
