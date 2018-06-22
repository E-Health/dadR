#' DADComorbidity returns the comorbidities for a given disease.
#'
#' @param disease
#' @param spark_data_frame
#'
#' @return comorbidities as data table
#' @export
#'
#' @examples
#' r_dt <- DADComorbidity("G20")
DADComorbidity <- function(disease, spark_data_frame = NULL){
  if(!is.null(spark_data_frame)){
    createOrReplaceTempView(spark_data_frame, "spark_data_frame")
  }

  patient_set = DADSameDisease(disease)
  createOrReplaceTempView(patient_set, "patient_set")
  comorbidity = sql("SELECT
  CONCAT(D_I10_1, ',', D_I10_2,
  ',', D_I10_3,
  ',', D_I10_4,
  ',', D_I10_5,
  ',', D_I10_6,
  ',', D_I10_7,
  ',', D_I10_8,
  ',', D_I10_9,
  ',', D_I10_10,
  ',', D_I10_11,
  ',', D_I10_12,
  ',', D_I10_13,
  ',', D_I10_14,
  ',', D_I10_15,
  ',', D_I10_16,
  ',', D_I10_17,
  ',', D_I10_18,
  ',', D_I10_19,
  ',', D_I10_20) as disease FROM patient_set")

    ## Collect as a data table with disease as the only column
    r_df <- collect(comorbidity)
    r_dt <- as.data.table(r_df)

    ## Split on ,
    ## https://stackoverflow.com/questions/15347282/split-delimited-strings-in-a-column-and-insert-as-new-rows

    s <- strsplit(r_df$disease, split = ",")
    ## https://stackoverflow.com/questions/29144759/r-removing-blanks-from-the-list
    s <- lapply(s, function(x) gsub(" ", "", x, fixed = TRUE))
    s <- lapply(s, function(x) x[!x %in% ""])
    df = data.frame(disease = unlist(s))
    occurences <- table(unlist(df))
    occurences <- as.data.frame(t(occurences))
    names(occurences) <- c("", "ICD10", "FREQUENCY")
    df <- occurences[,2:3]
    return(df[order(-df$FREQUENCY),])
}
