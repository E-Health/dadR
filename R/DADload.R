
#' DADload: Loads the DAD data file and saves as an RDA file
#'
#' @param savfile The full path to the DAD SPSS file
#' @param rdafile The full path to the Rda file created. dadR in working dir if empty.
#'
#'
#' @export
#'
#' @examples
#' DADload("~/clin_sample_spss.sav")
DADload <- function(savfile, rdafile = ""){
  # Convert SPSS sav file to Rda
  dataset = read.spss(savfile, to.data.frame=TRUE)
  if(rdafile != ""){
    save(dataset,file=rdafile)
  }else{
    current_path = dirname(savfile)
    rdafile <- paste(current_path, "/dadr.rda", sep = "")
    save(dataset,file=rdafile)
  }
}
