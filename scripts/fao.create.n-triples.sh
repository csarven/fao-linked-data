#!/bin/bash

data="/data/fao-linked-data/data/";

rm "$data"import/*.nt ;


#ls -1 "$data"*.rdf | grep -E "DATASTRUCTURE|prov|CL_|FAOSTAT|GENERAL_CONCEPT_SCHEME" | while read i ; do file=$(basename "$i"); fn=${file%.*}; rapper -g "$i" > "$data"import/"$fn".nt ; done

DataSetCodes=(AQUACULTURE_QUANTITY AQUACULTURE_US_DOLLAR CAPTURE SEATL_CAPTURE RECOFI_CAPTURE CECAF_CAPTURE GFCM_CAPTURE GLOBAL_PRODUCTION TRADE_QUANTITY TRADE_US_DOLLAR) ;
for DataSetCode in "${DataSetCodes[@]}" ; do ls -1 "$data""$DataSetCode"*.rdf | while read i ; do rapper -g "$i" >> "$data"import/"$DataSetCode".nt ; done done

#real    18m4.680s
#user    16m49.835s
#sys     0m23.049s
