#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

data="/data/fao-linked-data/data/";
namespace="http://fao.270a.info/";
graphs="/home/sarcap/Graphs/";
tdbAssembler="/usr/lib/fuseki/tdb.fao.ttl";
JVM_ARGS="-Xmx12000M";

#java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/void /var/www/fao.270a.info/void.ttl;

java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sd.nt
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs""prov-o.nt"
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"skos.rdf
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sdmx.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sdmx-attribute.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sdmx-dimension.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sdmx-code.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sdmx-concept.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sdmx-metadata.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sdmx-subject.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"cube.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"reference.data.gov.uk.def.intervals.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"reference.data.gov.uk.doc.year.ttl
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"reference.data.gov.uk.doc.gregorian-instant.ttl

./fao.tdbstats.sh
