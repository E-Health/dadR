#' DADTlosForTreatment returns the mean tlos for a given treatment.
#'
#' @param treatment
#' @param spark_data_frame
#'
#' @return tlos as double
#' @export
#'
#' @examples
#' r_dt <- DADTlos("G20")
DADTlosForTreatment <- function(treatment, spark_data_frame = NULL){
    if(!is.null(spark_data_frame)){
        createOrReplaceTempView(spark_data_frame, "spark_data_frame")
    }

    spark_df <- DADSameTreatment(treatment)
    r_df <- collect(spark_df)
    return(mean(r_df$TLOS_CAT))
}
