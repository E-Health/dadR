#' Title DADSametreatment - List all records with given intervention.
#'
#' @param intervention
#' @param spark_data_frame
#'
#' @return spark_data_frame with records 
#' @export
#'
#' @examples
#' spark_df <- DADSameTreatment(" 1QE35JAG7")
#'   r_df <- collect(spark_df)
#'   r_dt <- as.data.table(r_df)
#'   r_dt  # All records with the intervention 1QE35JAG7
DADSameTreatment <- function(treatment, spark_data_frame = NULL){
    if(!is.null(spark_data_frame)){
        createOrReplaceTempView(spark_data_frame, "spark_data_frame")
    }
    sql_query = paste("SELECT * FROM spark_data_frame WHERE",
    " I_CCI_1 = '", treatment, "' OR ",
    " I_CCI_2 = '", treatment, "' OR ",
    " I_CCI_3 = '", treatment, "' OR ",
    " I_CCI_4 = '", treatment, "' OR ",
    " I_CCI_5 = '", treatment, "' OR ",
    " I_CCI_6 = '", treatment, "' OR ",
    " I_CCI_7 = '", treatment, "' OR ",
    " I_CCI_8 = '", treatment, "' OR ",
    " I_CCI_9 = '", treatment, "' OR ",
    " I_CCI_10 = '", treatment, "' OR ",
    " I_CCI_11 = '", treatment, "' OR ",
    " I_CCI_12 = '", treatment, "' OR ",
    " I_CCI_13 = '", treatment, "' OR ",
    " I_CCI_14 = '", treatment, "' OR ",
    " I_CCI_15 = '", treatment, "' OR ",
    " I_CCI_16 = '", treatment, "' OR ",
    " I_CCI_17 = '", treatment, "' OR ",
    " I_CCI_18 = '", treatment, "' OR ",
    " I_CCI_19 = '", treatment, "' OR ",
    " I_CCI_20 = '", treatment, "'", sep="")
    return(sql(sql_query))
}
