#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./fao.config.sh

java "$JVM_ARGS" tdb.tdbstats --loc="$db" --graph=urn:x-arq:UnionGraph > "$db"stats2.opt ;
mv "$db"stats.opt "$db"stats.bak ;
mv "$db"stats2.opt "$db"stats.opt ;
