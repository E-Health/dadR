# This will be run before running tests

library(SparkR)
library(data.table)
library(foreign)

# Try to read the master UI from csvFile
# https://stackoverflow.com/questions/12626637/reading-a-text-file-in-r-line-by-line
    con = file("/home/beapen/scratch/dadr.out", "r")
    masterui = "spark://cdr541.int.cedar.computecanada.ca:7077"
    while ( TRUE ) {
        line = readLines(con, n = 1)
        if ( length(line) == 0 ) {
            break
        }
        # print(line)
        if (grepl("spark://cdr", line)){
            masterui = line
        }
    }

    close(con)

# Change Master UI here
sparkR.session(master = masterui, sparkConfig = list(spark.driver.memory = "3g", spark.executor.memory = "3g"))

DADSparkInit(csvFile = "/home/beapen/project/beapen/dadr/dadr.csv")

