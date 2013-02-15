#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

data="/data/fao-linked-data/data/";
namespace="http://fao.270a.info/";
db="/SSD/data/tdb/db/fao/" ;
tdbAssembler="/usr/lib/fuseki/tdb.fao.ttl";
JVM_ARGS="-Xmx12000M"

echo "Removing $db";
rm -rf "$db";

datestarts=(1950 1955 1960 1965 1970 1975 1980 1985 1990 1995 2000 2005) ;
dateends=(1954 1959 1964 1969 1974 1979 1984 1989 1994 1999 2004 2009) ;
DataSetCodes=(AQUACULTURE_QUANTITY AQUACULTURE_US_DOLLAR CAPTURE SEATL_CAPTURE RECOFI_CAPTURE CECAF_CAPTURE GFCM_CAPTURE GLOBAL_PRODUCTION TRADE_QUANTITY TRADE_US_DOLLAR) ;

#N-Triples
for DataSetCode in "${DataSetCodes[@]}" ; do java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/"$DataSetCode" "$data"import/"$DataSetCode".nt ; done

#ls -1 "$data"import/*.nt | grep -E "DATASTRUCTURE|prov|CL_|FAOSTAT|GENERAL_CONCEPT_SCHEME" | while read i ; do java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/meta "$i" ; done


#RDF/XML
#counter=0 ;

#for DataSetCode in "${DataSetCodes[@]}" ;
#    do
#        let "counter=0" ;
#        for datestart in "${datestarts[@]}" ;
#            do
#                dateend=`expr ${dateends[$counter]}` ;
#                rdfDocument="$data""$DataSetCode"."$datestart"."$dateend".rdf ;
#                if [ -s "$rdfDocument" ]
#                then
#                    java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/"$DataSetCode" "$rdfDocument"
#                fi
#                (( counter++ )) ;
#            done ;
#    done ;


#for DataSetCode in "${DataSetCodes[@]}" ; do java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/"$DataSetCode" "$data""$DataSetCode".rdf ; done

ls -1 "$data"*.rdf | grep -E "DATASTRUCTURE|prov|CL_|FAOSTAT|GENERAL_CONCEPT_SCHEME" | while read i ; do java "$JVM_ARGS" tdb.tdbloader -v --desc="$tdbAssembler" --graph="$namespace"graph/meta "$i" ; done 


./fao.tdbstats.sh
#real    23m30.705s
#user    27m34.675s
#sys     1m27.949s



