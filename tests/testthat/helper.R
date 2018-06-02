# This will be run before running tests

library(SparkR)
library(data.table)
library(foreign)

# Change Master UI here
sparkR.session(master = "localhost", sparkConfig = list(spark.driver.memory = "3g", spark.executor.memory = "3g"))

DADSparkInit(csvFile = "/path/to/file/dadr.csv")

spark_df <- sql("SELECT * FROM spark_data_frame WHERE SUB_PROV = 1")
