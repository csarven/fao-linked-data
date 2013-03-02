#!/bin/bash

. ./fao.config.sh

cd "$data"
time tar -cvzf meta.tar.gz *DATASTRUCTURE*.rdf CL_*.rdf FAOSTAT*.rdf GENERAL_CONCEPT_SCHEME*.rdf fao.*

time tar -cvzf data.tar.gz *.rdf --exclude='*DATASTRUCTURE*.rdf' --exclude='CL_*.rdf' --exclude='FAOSTAT*.rdf' --exclude='GENERAL_CONCEPT_SCHEME*.rdf' --exclude='fao.*'

#326M    data.tar.gz
#1.9M    meta.tar.gz

