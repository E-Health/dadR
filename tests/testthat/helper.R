# This will be run before running tests

library(SparkR)
library(data.table)
library(foreign)

masterui = "spark://"


# Change Master UI here
sparkR.session(master = masterui, sparkConfig = list(spark.driver.memory = "3g", spark.executor.memory = "3g"))

DADSparkInit(csvFile = "/path/to/dadr.csv")

