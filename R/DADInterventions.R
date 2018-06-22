#' DADInterventions returns the common interventions for a given conditions.
#'
#' @param disease
#' @param spark_data_frame
#'
#' @return interventions as data table
#' @export
#'
#' @examples
#' r_dt <- DADInterventions("G20")
DADInterventions <- function(disease, spark_data_frame = NULL){
  if(!is.null(spark_data_frame)){
    createOrReplaceTempView(spark_data_frame, "spark_data_frame")
  }

  patient_set = DADSameDisease(disease)
  createOrReplaceTempView(patient_set, "patient_set")
  cointerventions = sql("SELECT
  CONCAT(I_CCI_1, ',', I_CCI_2,
  ',', I_CCI_3,
  ',', I_CCI_4,
  ',', I_CCI_5,
  ',', I_CCI_6,
  ',', I_CCI_7,
  ',', I_CCI_8,
  ',', I_CCI_9,
  ',', I_CCI_10,
  ',', I_CCI_11,
  ',', I_CCI_12,
  ',', I_CCI_13,
  ',', I_CCI_14,
  ',', I_CCI_15,
  ',', I_CCI_16,
  ',', I_CCI_17,
  ',', I_CCI_18,
  ',', I_CCI_19,
  ',', I_CCI_20) as treatment FROM patient_set")

    ## Collect as a data table with disease as the only column
    r_df <- collect(cointerventions)
    r_dt <- as.data.table(r_df)

    ## Split on ,
    ## https://stackoverflow.com/questions/15347282/split-delimited-strings-in-a-column-and-insert-as-new-rows

    s <- strsplit(r_df$treatment, split = ",")
    ## https://stackoverflow.com/questions/29144759/r-removing-blanks-from-the-list
    s <- lapply(s, function(x) gsub(" ", "", x, fixed = TRUE))
    s <- lapply(s, function(x) x[!x %in% ""])
    df = data.frame(treatment = unlist(s))
    occurences <- table(unlist(df))
    occurences <- as.data.frame(t(occurences))
    names(occurences) <- c("", "CCI", "FREQUENCY")
    df <- occurences[,2:3]
    return(df[order(-df$FREQUENCY),])
}
