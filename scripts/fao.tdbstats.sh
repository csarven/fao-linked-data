#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

db="/SSD/data/tdb/db/fao/" ;
JVM_ARGS="-Xmx12000M" ;

java "$JVM_ARGS" tdb.tdbstats --loc="$db" --graph=urn:x-arq:UnionGraph > "$db"stats2.opt ;
mv "$db"stats.opt "$db"stats.bak ;
mv "$db"stats2.opt "$db"stats.opt ;
