#!/bin/bash

data="/data/fao-linked-data/data/"

cd "$data"
time tar -cvzf meta.tar.gz *DATASTRUCTURE*.rdf prov.rdf CL_*.rdf FAOSTAT*.rdf GENERAL_CONCEPT_SCHEME*.rdf

time tar -cvzf data.tar.gz *.rdf --exclude='DATASTRUCTURE*.rdf' --exclude='prov.rdf' --exclude='CL_*.rdf' --exclude='FAOSTAT*.rdf' --exclude='GENERAL_CONCEPT_SCHEME*.rdf'

#326M    data.tar.gz
#1.9M    meta.tar.gz

