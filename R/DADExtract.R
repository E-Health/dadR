# Title     : DADExtract
# Objective : Converts the flat file to normalized data tables
# Created by: beapen
# Created on: 21/05/18

# returns string w/o leading whitespace
trim.leading <- function (x)  sub("^\\s+", "", x)

# returns string w/o trailing whitespace
trim.trailing <- function (x) sub("\\s+$", "", x)

# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

#' DADExtract converts the flat file to normalized data tables
#'
#' @param dad_path_data
#'
#' @return string file path where the data tables are saved
#' @export
#'
#' @examples
#' handle <- DADExtract(DADread(DADload(file_path)))
#'
DADExtract <- function(dad_path_data){
    # Get file path and the dataset from the list
    file_path <- dad_path_data$file_path
    dad_dataset <- dad_path_data$dad_dataset

    print("Initializing... This may take some time..")
    # create data table
    dad_demographic <- data.table(
        PID = double(),
        AGE = character(),
        GENDER = character(),
        PROVINCE = character()
    )
    dad_morbidity <- data.table(
        PID = double(),
        ICD10 = character(),
        TYPE = character()
    )

    dad_intervention <- data.table(
        PID = double(),
        CCI = character(),
        STATUS = character(),
        LOCATION = character(),
        ANAESTHETIC = character()
    )

    dad_care <- data.table(
        PID = double(),
        ICU = character(),
        HOURS = integer()
    )

    dad_stay <- data.table(
        PID = double(),
        TLOS = integer(),
        ALOS = integer(),
        ALCLOS = integer(),
        DISP = integer(),
        CATEGORY = character(),
        INSTITUTION = character(),
        ENTRY = character(),
        WEIGHT = integer(),
        GESTATION = integer()
    )

    for(i in 1:nrow(dad_dataset)){
        cat("\r",i)
        row <- list(
            dad_dataset[i, "PATNT_ID"],
            dad_dataset[i, "AGRP_F_D"],
            dad_dataset[i, "GENDER"],
            dad_dataset[i, "SUB_PROV"]
        )
        dad_demographic <- rbindlist(list(dad_demographic, row))

        for(j in 1:25){
            ICD10var = paste("D_I10_", j, sep="")
            TYPEvar = paste("D_TYP_", j, sep="")
            ICD10 = trim(dad_dataset[i, ICD10var])
            if(ICD10 != ""){
            rowj <- list(
            dad_dataset[i, "PATNT_ID"],
            dad_dataset[i, ICD10var],
            dad_dataset[i, TYPEvar]
            )
            dad_morbidity <- rbindlist(list(dad_morbidity, rowj))
            }
        }

        for(k in 1:20){
            CCIvar = paste("I_CCI_", k, sep="")
            STATUSvar = paste("ST_AT_", k, sep="")
            LOCATIONvar = paste("LC_AT_", k, sep="")
            ANAESTHETICvar = paste("AN_TE_", k, sep="")
            CCI = trim(dad_dataset[i, CCIvar])
            if(CCI != ""){
                rowk <- list(
                dad_dataset[i, "PATNT_ID"],
                dad_dataset[i, CCIvar],
                dad_dataset[i, STATUSvar],
                dad_dataset[i, LOCATIONvar],
                dad_dataset[i, ANAESTHETICvar]
                )
                dad_intervention<- rbindlist(list(dad_intervention, rowk))
            }
        }

        for(l in 1:6){
            ICUvar = paste("SCU_C_", l, sep="")
            HOURSvar = paste("S_L_HR_", l, sep="")
            ICU = trim(dad_dataset[i, ICUvar])
            if(ICU != ""){
                rowl <- list(
                dad_dataset[i, "PATNT_ID"],
                dad_dataset[i, ICUvar],
                dad_dataset[i, HOURSvar]
                )
                dad_care <- rbindlist(list(dad_care, rowl))
            }
        }

        rowm <- list(
            dad_dataset[i, "PATNT_ID"],
            dad_dataset[i, "TLOS_CAT"],
            dad_dataset[i, "ACT_LCAT"],
            dad_dataset[i, "ALC_LCAT"],
            dad_dataset[i, "DIS_DISP"],
            dad_dataset[i, "ADM_CAT"],
            dad_dataset[i, "X_TO_I_T"],
            dad_dataset[i, "ENT_CODE"],
            dad_dataset[i, "WGHT_GRP"],
            dad_dataset[i, "GES_AGRP"]
        )
        dad_stay <- rbindlist(list(dad_stay, rowm))
    }

    print(dad_demographic)
    print(dad_morbidity)
    print(dad_intervention)
    print(dad_care)
    print(dad_stay)

    print("Saving demographic ...")
    rda_file <- file.path(file_path, "dad_demographic.rda", fsep = .Platform$file.sep)
    save(dad_demographic,file=rda_file)

    print("Saving morbidity ...")
    rda_file <- file.path(file_path, "dad_morbidity.rda", fsep = .Platform$file.sep)
    save(dad_morbidity,file=rda_file)

    print("Saving interventions ...")
    rda_file <- file.path(file_path, "dad_intervention.rda", fsep = .Platform$file.sep)
    save(dad_intervention,file=rda_file)

    print("Saving special care ...")
    rda_file <- file.path(file_path, "dad_care.rda", fsep = .Platform$file.sep)
    save(dad_care,file=rda_file)

    print("Saving length of stay ...")
    rda_file <- file.path(file_path, "dad_stay.rda", fsep = .Platform$file.sep)
    save(dad_stay,file=rda_file)

    return(file_path)
}

