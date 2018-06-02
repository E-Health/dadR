# This will be run before running tests

library(SparkR)
library(data.table)
library(foreign)

# Change Master UI here
sparkR.session(master = "spark://cdr541.int.cedar.computecanada.ca:7077", sparkConfig = list(spark.driver.memory = "3g", spark.executor.memory = "3g"))

DADSparkInit(csvFile = "/home/beapen/scratch/dadr.csv")

