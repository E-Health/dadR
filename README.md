# dadR - Apache Spark enabled library to analyze Discharge Abstract Database

## Work in progress

## Installation 

``` r
devtools::install_github("E-Health/dadR")

```

## Modules
* [x] DADSameDisease - Lists all records with the given diagnosis.
* [x] DADSameTreatment - Lists all records with the given intervention.
* [ ] DADComorbidity - Lists the comorbidities for the given condition.
* [ ] DADSimilarCases - Lists all records similar to the index case.
* [ ] DADTlos - Average length of stay for a given condition.
* [ ] DADInterventions - Lists common Interventions for a given condition.
* [ ] DADBestInterventions - Lists Interventions with least length of stay for a given condition.

## How to use

* Install Apache Spark (https://spark.apache.org/). 

``` r

  library(SparkR)
  library(data.table)
  library(foreign)
  library(dadR)
  
  # Change Master UI here
  sparkR.session(master = "localhost", sparkConfig = list(spark.driver.memory = "3g", spark.executor.memory = "3g"))

  DADSparkInit(savFile = "path/to/dad_sample_2015.sav")

  DADSparkInit(csvFile = "path/to/dadr.csv") # csv will be automatically created the first time

  spark_df <- DADSameDisease("J08")
  r_df <- collect(spark_df)
  r_dt <- as.data.table(r_df)
  r_dt  # All records with the diagnosis J08

```

## Contributors

* Bell Eapen (McMaster U) canehealth.com
* This package is developed and tested using ComputeCanada cluster.
