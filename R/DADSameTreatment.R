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
                      " I_CCI_1 LIKE '", treatment, "%' OR ",
                      " I_CCI_2 LIKE '", treatment, "%' OR ",
                      " I_CCI_3 LIKE '", treatment, "%' OR ",
                      " I_CCI_4 LIKE '", treatment, "%' OR ",
                      " I_CCI_5 LIKE '", treatment, "%' OR ",
                      " I_CCI_6 LIKE '", treatment, "%' OR ",
                      " I_CCI_7 LIKE '", treatment, "%' OR ",
                      " I_CCI_8 LIKE '", treatment, "%' OR ",
                      " I_CCI_9 LIKE '", treatment, "%' OR ",
                      " I_CCI_10 LIKE '", treatment, "%' OR ",
                      " I_CCI_11 LIKE '", treatment, "%' OR ",
                      " I_CCI_12 LIKE '", treatment, "%' OR ",
                      " I_CCI_13 LIKE '", treatment, "%' OR ",
                      " I_CCI_14 LIKE '", treatment, "%' OR ",
                      " I_CCI_15 LIKE '", treatment, "%' OR ",
                      " I_CCI_16 LIKE '", treatment, "%' OR ",
                      " I_CCI_17 LIKE '", treatment, "%' OR ",
                      " I_CCI_18 LIKE '", treatment, "%' OR ",
                      " I_CCI_19 LIKE '", treatment, "%' OR ",
                      " I_CCI_20 LIKE '", treatment, "%'", sep="")
    return(sql(sql_query))
}
