#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./fao.config.sh

java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"sd.nt
java "$JVM_ARGS" tdb.tdbloader --desc="$tdbAssembler" --graph="$namespace"graph/meta "$graphs"prov-o.nt
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
