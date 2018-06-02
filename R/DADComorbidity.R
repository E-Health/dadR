#' DADComorbidity returns the comorbidities for a given disease.
#'
#' @param disease
#' @param spark_data_frame
#'
#' @return
#' @export
#'
#' @examples
DADComorbidity <- function(disease, spark_data_frame = NULL){
  if(!is.null(spark_data_frame)){
    createOrReplaceTempView(spark_data_frame, "spark_data_frame")
  }

  patient_set = DADSameDisease(disease)
  createOrReplaceTempView(patient_set, "patient_set")
  comorbidity = sql("SELECT
  CONCAT(D_I10_1, ' ', D_I10_2,
  ' ', D_I10_3,
  ' ', D_I10_4,
  ' ', D_I10_5,
  ' ', D_I10_6,
  ' ', D_I10_7,
  ' ', D_I10_8,
  ' ', D_I10_9,
  ' ', D_I10_10,
  ' ', D_I10_11,
  ' ', D_I10_12,
  ' ', D_I10_13,
  ' ', D_I10_14,
  ' ', D_I10_15,
  ' ', D_I10_16,
  ' ', D_I10_17,
  ' ', D_I10_18,
  ' ', D_I10_19,
  ' ', D_I10_20) as disease FROM patient_set")
   return(summarize(groupBy(comorbidity, comorbidity$disease), count = n(comorbidity$disease)))
}
