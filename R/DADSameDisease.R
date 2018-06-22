#' Title DADSameDisease - List all records with given diagnosis.
#'
#' @param disease
#' @param spark_data_frame
#'
#' @return spark_data_frame with records
#' @export
#'
#' @examples
#' spark_df <- DADSameDisease("J08")
#'   r_df <- collect(spark_df)
#'   r_dt <- as.data.table(r_df)
#'   r_dt  # All records with the diagnosis J08
DADSameDisease <- function(disease, spark_data_frame = NULL){
    if(!is.null(spark_data_frame)){
        createOrReplaceTempView(spark_data_frame, "spark_data_frame")
    }
  sql_query = paste("SELECT * FROM spark_data_frame WHERE",
                       " D_I10_1 LIKE '", disease, "%' OR ",
                       " D_I10_2 LIKE '", disease, "%' OR ",
                       " D_I10_3 LIKE '", disease, "%' OR ",
                       " D_I10_4 LIKE '", disease, "%' OR ",
                       " D_I10_5 LIKE '", disease, "%' OR ",
                       " D_I10_6 LIKE '", disease, "%' OR ",
                       " D_I10_7 LIKE '", disease, "%' OR ",
                       " D_I10_8 LIKE '", disease, "%' OR ",
                       " D_I10_9 LIKE '", disease, "%' OR ",
                       " D_I10_10 LIKE '", disease, "%' OR ",
                       " D_I10_11 LIKE '", disease, "%' OR ",
                       " D_I10_12 LIKE '", disease, "%' OR ",
                       " D_I10_13 LIKE '", disease, "%' OR ",
                       " D_I10_14 LIKE '", disease, "%' OR ",
                       " D_I10_15 LIKE '", disease, "%' OR ",
                       " D_I10_16 LIKE '", disease, "%' OR ",
                       " D_I10_17 LIKE '", disease, "%' OR ",
                       " D_I10_18 LIKE '", disease, "%' OR ",
                       " D_I10_19 LIKE '", disease, "%' OR ",
                       " D_I10_20 LIKE '", disease, "%' OR ",
                       " D_I10_21 LIKE '", disease, "%' OR ",
                       " D_I10_22 LIKE '", disease, "%' OR ",
                       " D_I10_23 LIKE '", disease, "%' OR ",
                       " D_I10_24 LIKE '", disease, "%' OR ",
                       " D_I10_25 LIKE '", disease, "%'", sep = "")

    return(sql(sql_query))
}
