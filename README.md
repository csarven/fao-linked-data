# FAO Linked Data

Scripts and additional data to realize the http://fao.270a.info/ dataspace.

The workflow is as follows:

* Retrieve the data from source
* The remaining scripts depend on the SDMX-ML to RDF/XML transformation
using [Linked SDMX](https://github.com/csarven/linked-sdmx). See also
documentation at [Linked SDMX Data](http://csarven.ca/linked-sdmx-data).
* Create N-Triples files for importing to respective named graphs in RDF store
* Import N-triples as well as other enrichments to
[Jena TDB](http://jena.apache.org/documentation/tdb/)
* Create statistics using [LODStats](https://github.com/AKSW/LODStats)
* Create a VoID file (includes LODStats) and import into RDF Store
* Create data dumps
* Import additional metadata to RDF store
* Create post-processing metadata (includes VoID and PROV-O Activities)
* Run [TDB Optimizer](https://jena.apache.org/documentation/tdb/optimizer.html)

The additional data included contains the following:

* Interlinks to other datasets
* Vocabulary alignment and other enrichments
* Post-processing metadata
