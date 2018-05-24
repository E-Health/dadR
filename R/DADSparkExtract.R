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
DADSameDisease <- function(disease, spark_data_frame = NULL){
    if(!is.null(spark_data_frame)){
        createOrReplaceTempView(spark_data_frame, "spark_data_frame")
    }
    # sql_query = "SELECT * FROM spark_data_frame WHERE D_I10_1 = 'J09'"
    sql_query = paste("SELECT * FROM spark_data_frame WHERE",
    " D_I10_1 = '", disease, "' OR ",
    " D_I10_2 = '", disease, "' OR ",
    " D_I10_3 = '", disease, "' OR ",
    " D_I10_4 = '", disease, "' OR ",
    " D_I10_5 = '", disease, "' OR ",
    " D_I10_6 = '", disease, "' OR ",
    " D_I10_7 = '", disease, "' OR ",
    " D_I10_8 = '", disease, "' OR ",
    " D_I10_9 = '", disease, "' OR ",
    " D_I10_10 = '", disease, "' OR ",
    " D_I10_11 = '", disease, "' OR ",
    " D_I10_12 = '", disease, "' OR ",
    " D_I10_13 = '", disease, "' OR ",
    " D_I10_14 = '", disease, "' OR ",
    " D_I10_15 = '", disease, "' OR ",
    " D_I10_16 = '", disease, "' OR ",
    " D_I10_17 = '", disease, "' OR ",
    " D_I10_18 = '", disease, "' OR ",
    " D_I10_19 = '", disease, "' OR ",
    " D_I10_20 = '", disease, "' OR ",
    " D_I10_21 = '", disease, "' OR ",
    " D_I10_22 = '", disease, "' OR ",
    " D_I10_23 = '", disease, "' OR ",
    " D_I10_24 = '", disease, "' OR ",
    " D_I10_25 = '", disease, "'", sep="")
    print(sql_query)
    return(sql(sql_query))
}
