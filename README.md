# dadR - A Apache Spark enabled library to analyze Discharge Abstract Database

## Work in progress

## Installation (Keep updating always)
``` r
devtools::install_github("E-Health/dadR")

```

## How to use

* Install Apache Spark (https://spark.apache.org/). This package is developed and tested using
ComputeCanada cluster. (http://computecanada.ca/).

``` r

  library(SparkR)
  library(data.table)
  library(foreign)

  # Change Master UI here
  sparkR.session(master = "localhost", sparkConfig = list(spark.driver.memory = "3g", spark.executor.memory = "3g"))

  DADSparkInit(savFile = "path/to/dad_sample_2015.sav")

  DADSparkInit(csvFile = "path/to/dadr.csv") # csv will be automatically created the first time

  spark_df <- DADSameDisease("J08")
  r_df <- collect(spark_df)
  r_dt <- as.data.table(r_df)
  r_dt  # All records with the diagnosis J08

```
## Contributing

* Read this to contribute: http://r-bio.github.io/intro-git-rstudio/
* And follow these steps: http://stat545.com/packages04_foofactors-package-01.html (Read part II too)

## Contributors

* Bell Eapen (McMaster U) canehealth.com
