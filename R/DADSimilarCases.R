#' DADSimilarCases returns the cases similar to index case.
#'
#' @param index case
#' @param spark_data_frame
#'
#' @return similar cases as a dataframe
#' @export
#'
#' @examples
#' r_dt <- DADSimilarCases(case)
DADSimilarCases <- function(case = "Not implemented Yet", spark_data_frame = NULL){
    if(!is.null(spark_data_frame)){
        createOrReplaceTempView(spark_data_frame, "spark_data_frame")
    }

    return("Not implemented Yet")
}
