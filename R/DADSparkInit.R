# Title     : TODO
# Objective : TODO
# Created by: beapen
# Created on: 23/05/18

# library(sparkR)
# sparkR.session(master = "spark://cdr1258.int.cedar.computecanada.ca:7077", sparkConfig = list(spark.driver.memory = "4g"))
#' Title
#'
#' @param savfile
#' @param csvfile
#' @param fileExists
#'
#' @return
#' @export
#'
#' @examples
DADSparkInit <- function(savFile = "", csvFile = NULL){

    if(is.null(csvFile)){
      # Convert SPSS sav file to Rda
      dad_dataset = read.spss(savFile, to.data.frame=TRUE)
      current_path = dirname(savFile)
      csvfile <- file.path(current_path, "dadr.csv", fsep = .Platform$file.sep)
      write.csv(dad_dataset, file = csvfile)
    }
    current_path = dirname(csvFile)
    csvfile <- file.path(current_path, "dadr.csv", fsep = .Platform$file.sep)
    spark_data_frame <- read.df(csvfile, "csv", header = "true", inferSchema = "true", na.strings = "NA")
    createOrReplaceTempView(spark_data_frame, "spark_data_frame")
    return(spark_data_frame)
}
