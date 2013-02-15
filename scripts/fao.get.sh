#!/bin/bash

#
#    Author: Sarven Capadisli <info@csarven.ca>
#    Author URI: http://csarven.ca/#i
#

data="/data/fao-linked-data/data/"

#grep -E "<a href=\"registry" data.fao.org.sdmx.registry-artefacts.html | perl -pe 's/(.*)(?=href)href=\"([^\"]*).*/http:\/\/data.fao.org\/sdmx\/$2/' | sort -u > meta.txt
#grep -E "<a href=\"registry" www.fao.org.figis.sdmx.registry-artefacts.html | perl -pe 's/(.*)(?=href)href=\"([^\"]*).*/http:\/\/www.fao.org\/figis\/sdmx\/$2/' | sort -u >> meta.txt
#wget "http://data.fao.org/sdmx/repository/data/TRADE_QUANTITY/all/FAO/?startPeriod=1900&endPeriod=2100&compression=true" -O TRADE_QUANTITY.zip
#wget "http://data.fao.org/sdmx/repository/data/TRADE_US_DOLLAR/all/FAO/?startPeriod=1900&endPeriod=2100&compression=true" -O TRADE_US_DOLLAR.zip

rm "$data"prov.rdf

echo '<?xml version="1.0" encoding="UTF-8"?>
<rdf:RDF
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:prov="http://www.w3.org/ns/prov#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:sdmx="http://purl.org/linked-data/sdmx#">' > "$data"prov.rdf ;

counter=0;
while read i ;
    do
        version=${i##*/} ;
        woVersion=${i%/*} ;
        DataSetCode=${woVersion##*/} ;

        echo "$counter $DataSetCode $version" ;

#        DataType="http://purl.org/linked-data/sdmx#DataStructureDefinition"
#        DataTypeLabel="Structure"

sleep 0.1
        dtstart=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtstartd=$(echo "$dtstart" | sed 's/[^0-9]*//g') ;
#        wget -t 0 --no-http-keep-alive "$i" -O "$data""$DataSetCode"."$version".xml
sleep 1
        dtend=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtendd=$(echo "$now" | sed 's/[^0-9]*//g') ;

        echo '
        <rdf:Description rdf:about="http://fao.270a.info/provenance/activity/'$dtstartd'">
            <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
            <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtstart'</prov:startedAtTime>
            <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtend'</prov:endedAtTime>
            <prov:wasAssociatedWith rdf:resource="http://csarven.ca/#i"/>
            <prov:used rdf:resource="https://launchpad.net/ubuntu/+source/wget"/>
            <prov:used>
                <rdf:Description rdf:about="'$i'">
                    <dcterms:identifier>'$DataSetCode'</dcterms:identifier>
                </rdf:Description>
            </prov:used>
            <prov:generated rdf:resource="http://fao.270a.info/data/'$DataSetCode'.'$version'.xml"/>
            <rdfs:label xml:lang="en">Retrieved '$DataSetCode' '$version'</rdfs:label>
            <rdfs:comment xml:lang="en">'$DataSetCode' '$version' retrieved from source and saved to local filesystem.</rdfs:comment>
        </rdf:Description>' >> "$data"prov.rdf ;

        (( counter++ ));

    done < meta.txt


datestarts=(1950 1955 1960 1965 1970 1975 1980 1985 1990 1995 2000 2005) ;
dateends=(1954 1959 1964 1969 1974 1979 1984 1989 1994 1999 2004 2009) ;
DataSetCodes=(AQUACULTURE_QUANTITY AQUACULTURE_US_DOLLAR CAPTURE SEATL_CAPTURE RECOFI_CAPTURE CECAF_CAPTURE GFCM_CAPTURE GLOBAL_PRODUCTION) ;

counter=0 ;

for DataSetCode in "${DataSetCodes[@]}" ;
    do
        let "counter=0" ;

        for datestart in "${datestarts[@]}"
            do
                dateend=`expr ${dateends[$counter]}` ;
sleep 0.1
                dtstart=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
                dtstartd=$(echo "$dtstart" | sed 's/[^0-9]*//g') ;

                downloadURL="http://www.fao.org/figis/sdmx/repository/data/$DataSetCode/all/FAO?startPeriod=$datestart&amp;endPeriod=$dateend" ;

                outputDocument="$data""$DataSetCode"."$datestart"."$dateend".xml ;

#                wget -t 0 --no-http-keep-alive "$downloadURL" -O "$outputDocument" ;

sleep 1
                dtend=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
                dtendd=$(echo "$dtend" | sed 's/[^0-9]*//g') ;

                echo "$counter $DataSetCode $datestart $dateend" ;

                echo '
                <rdf:Description rdf:about="http://fao.270a.info/provenance/activity/'$dtstartd'">
                    <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
                    <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtstart'</prov:startedAtTime>
                    <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtend'</prov:endedAtTime>
                    <prov:wasAssociatedWith rdf:resource="http://csarven.ca/#i"/>
                    <prov:used rdf:resource="https://launchpad.net/ubuntu/+source/wget"/>
                    <prov:used>
                        <rdf:Description rdf:about="'$downloadURL'">
                            <rdf:type rdf:resource="http://purl.org/linked-data/sdmx#DataSet"/>
                            <dcterms:identifier>'$DataSetCode'</dcterms:identifier>
                        </rdf:Description>
                    </prov:used>
                    <prov:generated rdf:resource="http://fao.270a.info/data/'$DataSetCode'.'$datestart'.'$dateend'.xml"/>
                    <rdfs:label xml:lang="en">Retrieved '$DataSetCode'</rdfs:label>
                    <rdfs:comment xml:lang="en">'$DataSetCode' retrieved from source and saved to local filesystem.</rdfs:comment>
                </rdf:Description>' >> "$data"prov.rdf ;

                (( counter++ )) ;
            done ;
    done ;



DataSetCodes=(TRADE_US_DOLLAR TRADE_QUANTITY) ;

for DataSetCode in "${DataSetCodes[@]}" ;
    do
sleep 0.1
        dtstart=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtstartd=$(echo "$dtstart" | sed 's/[^0-9]*//g') ;

        downloadURL="http://data.fao.org/sdmx/repository/data/$DataSetCode/all/FAO/?startPeriod=1900&amp;endPeriod=2100&amp;compression=true" ;

sleep 1
        dtend=$(date +"%Y-%m-%dT%H:%M:%SZ") ;
        dtendd=$(echo "$dtend" | sed 's/[^0-9]*//g') ;

        echo "$DataSetCode $version" ;

        echo '
        <rdf:Description rdf:about="http://fao.270a.info/provenance/activity/'$dtstartd'">
            <rdf:type rdf:resource="http://www.w3.org/ns/prov#Activity"/>
            <prov:startedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtstart'</prov:startedAtTime>
            <prov:endedAtTime rdf:datatype="http://www.w3.org/2001/XMLSchema#dateTime">'$dtend'</prov:endedAtTime>
            <prov:wasAssociatedWith rdf:resource="http://csarven.ca/#i"/>
            <prov:used rdf:resource="https://launchpad.net/ubuntu/+source/wget"/>
            <prov:used rdf:resource="https://launchpad.net/ubuntu/+source/unzip"/>
            <prov:used>
                <rdf:Description rdf:about="'$downloadURL'">
                    <rdf:type rdf:resource="http://purl.org/linked-data/sdmx#DataSet"/>
                    <dcterms:identifier>'$DataSetCode'</dcterms:identifier>
                </rdf:Description>
            </prov:used>
            <prov:generated rdf:resource="http://fao.270a.info/data/'$DataSetCode'.xml"/>
            <rdfs:label xml:lang="en">Retrieved '$DataSetCode'</rdfs:label>
            <rdfs:comment xml:lang="en">'$DataSetCode' retrieved from source and saved to local filesystem. Removed duplicate node tree.</rdfs:comment>
        </rdf:Description>' >> "$data"prov.rdf ;
    done


echo -e "\n</rdf:RDF>" >> "$data"prov.rdf ;
