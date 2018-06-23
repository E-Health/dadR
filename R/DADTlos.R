#' DADTlos returns the mean tlos for a given disease.
#'
#' @param disease
#' @param spark_data_frame
#'
#' @return tlos as double
#' @export
#'
#' @examples
#' r_dt <- DADTlos("G20")
DADTlos <- function(disease, spark_data_frame = NULL){
    if(!is.null(spark_data_frame)){
        createOrReplaceTempView(spark_data_frame, "spark_data_frame")
    }

    spark_df <- DADSameDisease(disease)
    r_df <- collect(spark_df)
    return(mean(r_df$TLOS_CAT))
}
