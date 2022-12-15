#' Generates data plots
#'
#' This function generates plots for Canada Immunization rates in 2020,
#' Influenza activity in Canada from August to December 2022, and Influenza
#' Confirmed Cases from January 2020 to December 2022.
#'
#'
#' @param type The type of data you would like to generate the plot for. Options
#' are immunization data (imm) and influenza case data for Canada (CA_flu,
#' CA_strains)
#' @param week
#' @param year
#' @param region
#' @return Generated plot
#' @export
#' @examples
#' plot_data("imm")

library(readxl)
library(tidyr)
library(tidyverse)

plot_data <- function(type, week, year, region){
  if(missing(type)){
    stop("Type must not be blank. Options are imm, CA_flu, NA_flu.")
  }
  if(type == "imm"){
    imm_data <- read_excel("inst/extdata/Canada_Imm_2020.xlsx")
    imm_df <- as.data.frame(imm_data)
    if(missing(week) && missing(year) && missing(region)){
      imm_df.long <- melt(imm_df, id="Age Range (years)",
                          measure=c("Number of People Male",
                                    "Number of People Female"))
      plot1 <- ggplot(data = imm_df.long, aes(x = `Age Range (years)`,y = value)
                      ) + geom_bar(aes(fill = variable),stat = 'identity',
                                   position = position_dodge(), alpha = 0.75) +
        scale_y_continuous(labels = label_comma()) + ylab("Number of Persons") +
        labs(fill="Sex") + ggtitle("Influenza Immunizations Canada 2020")
      return(plot1)
    }else{
      stop("Week, year, and region are not valid options for this data
           type")
    }
  }else if(type == "CA_flu"){
    ca_data <- read_excel("inst/extdata/Canada_wk35_48.xlsx")
    ca_df <- as.data.frame(ca_data)
    if(!(region %in% ca_df$Region_name_en)){
      stop("Must enter a valid region name")
    }
    if(!(week %in% ca_df$Week_Number)){
      stop("Must enter a valid week")
    }
    if(missing(year)){
      cleaned_data <- clean_data(ca_df, week, region)
      #plot
    }else{
      stop("Year is not a valid option for this data type")
    }
  }else if(type == "CA_flu_strains"){
    ca_strain_data <- read_excel("inst/extdata/CA_JAN2020_DEC2022.xlsx")
    ca_strain_df <- as.data.frame(ca_strain_data)
    if(!(week %in% ca_strain_df$ISO_week)){
      stop("Must enter a valid week")
    }
    if (!(year %in% ca_strain_df$ISO_YEAR)){
      stop("Must enter a valid year")
    }
    if(missing(region)){
      cleaned_data <- clean_data(ca_strain_df, week, year)
      #plot
    }else{
      stop("Region is not a valid option for this data type")
    }
  }
}
