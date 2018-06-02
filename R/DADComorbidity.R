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
  comorbidity = sql("SELECT D_I10_1 as disease FROM patient_set")
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_2 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_3 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_4 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_5 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_6 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_7 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_8 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_9 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_10 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_11 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_12 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_13 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_14 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_15 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_16 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_17 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_18 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_19 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_20 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_21 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_22 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_23 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_24 as disease FROM patient_set"))
  comorbidity = unionAll(comorbidity, sql("SELECT D_I10_25 as disease FROM patient_set"))
  return(summarize(groupBy(comorbidity, comorbidity$disease), count = n(comorbidity$disease)))
}
