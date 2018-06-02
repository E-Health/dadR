# dadR - Apache Spark enabled R package to analyze Discharge Abstract Database

## Why dadR

The DAD database is large and the flat SPSS sav format is not amenable to fast processing and data mining for clinical insights. dadR uses Apache Spark to parallelize search and extraction. Most functions return a Spark data frame. This includes some innovative clustering and other machine learning functions.

## Installation 

``` r
devtools::install_github("E-Health/dadR")

```

## Work in progress ...... (Feedback and contributions welcome!)

## Modules
* [x] DADSameDisease - Lists all records with the given diagnosis.
* [x] DADSameTreatment - Lists all records with the given intervention.
* [x] DADComorbidity - Lists the comorbidities for the given condition.
* [ ] DADSimilarCases - Lists all records similar to the index case (clustering).
* [ ] DADTlos - Average length of stay for a given condition.
* [ ] DADInterventions - Lists common Interventions for a given condition.
* [ ] DADBestInterventions - Lists Interventions with least length of stay for a given condition.
* [ ] DADInterventions - Lists common Interventions for a given condition.
* [ ] DADCharlsonIndex - Computes mean Charlson Index for a set of patients.
* [ ] DADRandomSample - Returns a random set of patients.
* [ ] DADCointerventions - Lists the cointerventions for the given intervention.

## How to use

* Install Apache Spark (https://spark.apache.org/). 
* Researchers can download DAD from Odesi. Please make sure that you comply with the licensing terms.

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

* Bell Eapen (McMaster U) [canehealth.com](http://canehealth.com)
* This package is developed and tested using [Compute Canada](www.computecanada.ca) resources.

## Citation

Please cite dadR in your publications if it helped your research. Here is an example BibTeX entry:

```

@misc{eapenbr2018,
  title={dadR - Spark enabled R package for analyzing discharge abstract database.},
  author={Eapen, Bell Raj and contributors},
  year={2018},
  publisher={GitHub},
  journal = {GitHub repository},
  howpublished={\url{https://github.com/E-Health/dadR}}
}

```
