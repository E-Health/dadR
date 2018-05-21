
#' DADread loads dadr rda file
#'
#' @param file_path
#'
#' @return list(file_path, dad_dataset)
#' @export
#'
#' @examples
#' DADread(Dadload("~/clin_sample_spss.sav"))
DADread <- function(file_path = ""){
  if(file_path == ""){
    file_path = getwd()
  }
  load_file = file.path(file_path, "dadr.rda", fsep = .Platform$file.sep)
  load(load_file) # Loads data into dad_dataset
  dad_path_data = list(file_path = file_path, dad_dataset = dad_dataset)
}
