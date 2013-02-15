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
query="fao.void.init.ttl";

echo Exporting "$namespace"graph/void to "$void" ;
java "$JVM_ARGS" tdb.tdbquery --time --desc="$tdbAssembler" --results=turtle --query="$query" > "$void" ;

#real    0m28.707s
#user    0m37.966s
#sys     0m2.112s
