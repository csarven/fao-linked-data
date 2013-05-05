#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

. ./fao.config.sh

#$ grep CodelistAliasRef HCL_*.xml | sort -u | grep -vE ">CL_"
#HCL_AREA_SUB_AREA.0.1.xml:                    <structure:CodelistAliasRef>FAO_MAJOR_AREA</structure:CodelistAliasRef>
#HCL_ASFIS_FAMILY_SPECIES.0.1.xml:                    <structure:CodelistAliasRef>SPECIES_FAMILY</structure:CodelistAliasRef>
#HCL_ASFIS_ISSCAAP_GROUP_SPECIES.0.1.xml:                    <structure:CodelistAliasRef>ISSCAAP_GROUP</structure:CodelistAliasRef>
#HCL_ASFIS_ORDER_FAMILY.0.1.xml:                    <structure:CodelistAliasRef>SPECIES_ORDER</structure:CodelistAliasRef>
#HCL_DIVISION_SUB_DIVISION.0.1.xml:                    <structure:CodelistAliasRef>DIVISION</structure:CodelistAliasRef>
#HCL_ISSCAAP_DIVISION_GROUP.0.1.xml:                    <structure:CodelistAliasRef>ISSCAAP_DIVISION</structure:CodelistAliasRef>
#HCL_SUB_AREA_DIVISION.0.1.xml:                    <structure:CodelistAliasRef>SUB_AREA</structure:CodelistAliasRef>
#HCL_SUB_DIVISION_SUB_UNIT.0.1.xml:                    <structure:CodelistAliasRef>SUB_DIVISION</structure:CodelistAliasRef>

for i in "$data"HCL*.xml ; do perl -pi -e 's/(.*)(?=CodelistAliasRef>)(CodelistAliasRef>)(?!CL_)(.*)(?=<)(.*)/$1$2CL_$3$4/' "$i" ; done


#$ grep -E "Hierarchy " *.xml
#HCL_AREA_SUB_AREA.0.1.xml:            <structure:Hierarchy id="HCL_AREA_SUB_AREA" version="0.1">
#HCL_ASFIS_FAMILY_SPECIES.0.1.xml:            <structure:Hierarchy id="HCL_ASFIS_FAMILY_SPECIES" version="0.1">
#HCL_ASFIS_ISSCAAP_GROUP_SPECIES.0.1.xml:            <structure:Hierarchy id="HCL_ASFIS_ISSCAAP_GROUP_SPECIES" version="0.1">
#HCL_ASFIS_ORDER_FAMILY.0.1.xml:            <structure:Hierarchy id="HCL_ASFIS_ORDER_FAMILY" version="0.1">
#HCL_ASFIS_SPECIES_TAX_SPECIES.0.1.xml:            <structure:Hierarchy id="HCL_ASFIS_SPECIES_TAX_SPECIES" version="0.1">
#HCL_DIVISION_SUB_DIVISION.0.1.xml:            <structure:Hierarchy id="HCL_DIVISION_SUB_DIVISION" version="0.1">
#HCL_ISSCAAP_DIVISION_GROUP.0.1.xml:            <structure:Hierarchy id="HCL_ISSCAAP_DIVISION_GROUP" version="0.1">
#HCL_SUB_AREA_DIVISION.0.1.xml:            <structure:Hierarchy id="HCL_SUB_AREA_DIVISION" version="0.1">
#HCL_SUB_DIVISION_SUB_UNIT.0.1.xml:            <structure:Hierarchy id="HCL_SUB_DIVISION_SUB_UNIT" version="0.1">

for i in "$data"HCL*.xml ; do perl -pi -e 's/(.*)(?=Hierarchy id=\"HCL_)Hierarchy id=\"HCL_(.*)(?=\")\"(.*)/$1Hierarchy id=\"HR_$2\"$3/' "$i" ; done
