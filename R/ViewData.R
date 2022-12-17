#' @import readxl
#'
#' Gets Data Tables
#'
#' This function produces allows the user to view the data provided in this
#' package
#'
#' @param data_type A character string of desired data to get table for. Possible
#' options are CA_strains, CA_Flu, and CA_Imm.
#' @return The data in a data frame, opens up separate window to view the
#' original data files within the GUI
#'
#' @examples
#' view_data_table("CA_Imm")

view_data_table <- function(data_type) {

  if (is.character(data_type)){
    #pass
  }else{
    stop("Make sure you are inputting a string value. Your options are:
         CA_strains, CA_Flu, CA_Imm")
  }

  if(data_type == "CA_strains"){
    fpath <- system.file("extdata", "CA_JAN2020_DEC2022.xlsx", package="Flulytics")
    CA_Flu_strains <- read_excel(fpath)
    CA_strain_df <- as.data.frame(CA_Flu_strains)
    View(CA_Flu_strains)
    return(CA_strain_df)
  }else if(data_type == "CA_Flu"){
    fpath <- system.file("extdata", "Canada_wk35_48.xlsx", package="Flulytics")
    CA_Flu <- read_excel(fpath)
    CA_flu_df <- as.data.frame(CA_Flu)
    View(CA_Flu)
    return(CA_flu_df)
  }else if(data_type == "CA_Imm"){
    fpath <- system.file("extdata", "Canada_Imm_2020.xlsx", package="Flulytics")
    CA_Imm <- read_excel(fpath)
    imm_df <- as.data.frame(CA_Imm)
    View(CA_Imm)
    return(imm_df)
  }else{
    stop("Invalid input for view_data_table(). Your options are: CA_strains,
    CA_Flu, CA_Imm")
  }

}

