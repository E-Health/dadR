# Title     : TODO
# Objective : TODO
# Created by: beapen
# Created on: 23/05/18

# returns string w/o leading whitespace
trim.leading <- function (x)  sub("^\\s+", "", x)

# returns string w/o trailing whitespace
trim.trailing <- function (x) sub("\\s+$", "", x)

# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

#' Title
#'
#' @param disease
#' @param spark_data_frame
#'
#' @return
#' @export
#'
#' @examples
DADSparkExtract <- function(disease, spark_data_frame = NULL){
   disease
}
