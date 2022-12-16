#' Generates data plots
#'
#' This function generates plots for Canada Immunization rates in 2020,
#' Influenza activity in Canada from August to December 2022, and Influenza
#' Confirmed Cases from January 2020 to December 2022.
#'
#' @param type The type of data you would like to generate the plot for. Options
#' are immunization data (imm) and influenza case data for Canada (CA_flu,
#' CA_strains)
#' @param week The week you would like to view data for
#' @param year The year you would like to view data for
#' @param region The region you would like to view data for
#' @return Generated plot
#' @export
#' @examples
#' plot_data("imm")
#' plot_data("CA_strains", year="2022")

plot_data <- function(type, week=NULL, year=NULL, region=NULL){
  library(readxl)
  library(tidyr)
  library(tidyverse)
  library(reshape2)
  library(scales)

  if(missing(type)){
    stop("Type must not be blank. Options are imm, CA_flu, CA_strains.")
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
    if(missing(week) && missing(region)){
      stop("Must enter either a valid week or region name")
    }else if(missing(week) && !(missing(region))){
      if(!(region %in% ca_df$Region_name_en)){
          stop("Must enter a valid region name")
      }else{
        cleaned_data <- dplyr::filter(ca_df, ca_df$Region_name_en == region)
        plot3 <- ggplot(data = cleaned_data, aes(x=Week_Number,
                                                 y=Activity_Level)) +
          geom_bar(aes(fill=Activity_Level), stat = 'identity') +
          ggtitle(paste(region,
                        "Influenza Activity Levels 2022 for weeks 35 to 48")) +
          xlab("Week Number") + ylab("") +labs("Activity Level")
        return(plot3)
      }
    }else if(missing(region) && !(missing(week))){
      if(!(week %in% ca_df$Week_Number)){
        stop("Must enter a valid week")
      }else{
        cleaned_data <- dplyr::filter(ca_df, ca_df$Week_Number == week)
        clean.long <- melt(cleaned_data, id="Activity_Level",
                           measure = c("Region_name_en"))
        plot4 <- ggplot(data = clean.long, aes(x=value, y=Activity_Level)) +
          geom_bar(aes(fill=value), stat = 'identity',
                   position = position_dodge()) +
          ggtitle(paste("Influenza Activity for week", week)) +
          theme(axis.text.x=element_blank()) + xlab("") +
          ylab("Activity Level") + guides(fill=guide_legend(title="Region"))

        return(plot4)
      }
    }
  }else if(type == "CA_flu_strains"){
    ca_strain_data <- read_excel("inst/extdata/CA_JAN2020_DEC2022.xlsx")
    ca_strain_df <- as.data.frame(ca_strain_data)
    ca_strain_df$AH1 <- as.numeric(ca_strain_df$AH1)
    ca_strain_df$AH1N12009 <- as.numeric(ca_strain_df$AH1N12009)
    ca_strain_df$AH3 <- as.numeric(ca_strain_df$AH3)
    ca_strain_df$AH5 <- as.numeric(ca_strain_df$AH5)
    ca_strain_df$ANOTSUBTYPED <- as.numeric(ca_strain_df$ANOTSUBTYPED)
    ca_strain_df$INF_A <- as.numeric(ca_strain_df$INF_A)
    ca_strain_df$BVIC <- as.numeric(ca_strain_df$BVIC)
    ca_strain_df$BYAM <- as.numeric(ca_strain_df$BYAM)
    ca_strain_df$BNOTDETERMINED <- as.numeric(ca_strain_df$BNOTDETERMINED)
    ca_strain_df$INF_B <- as.numeric(ca_strain_df$INF_B)
    ca_strain_df$INF_ALL <- as.numeric(ca_strain_df$INF_ALL)
    ca_strain_df$INF_NEGATIVE <- as.numeric(ca_strain_df$INF_NEGATIVE)

    if(missing(region)){
      if(missing(week) && !(missing(year))){
        if (!(year %in% ca_strain_df$ISO_YEAR)){
          stop("Must enter a valid year")
        }else{
          ca_strain_df$ISO_WEEK <- as.numeric(ca_strain_df$ISO_WEEK)
          cleaned_data <- dplyr::filter(ca_strain_df,
                                        ca_strain_df$ISO_YEAR == year)
          ca_strain.long = melt(cleaned_data, id="ISO_WEEK", measure=c("AH1",
                            "AH1N12009", "AH3", "AH5", "ANOTSUBTYPED", "INF_A",
                            "BVIC", "BYAM", "BNOTDETERMINED", "INF_B",
                            "INF_ALL", "INF_NEGATIVE"))
          plot5 <- ggplot(data = ca_strain.long, aes(x=ISO_WEEK, y=value)) +
            geom_bar(aes(fill=variable), stat = 'identity') +
            ylab("Number of Confirmed Cases") + xlab("Week") +
            guides(fill=guide_legend(title="Strain")) +
            ggtitle(paste("Canada confirmed influenza cases by strain for year",
                          year))
          return(plot5)
        }
      }else if(missing(year) && !(missing(week))){
        if(!(week %in% ca_strain_df$ISO_WEEK)){
          stop("Must enter a valid week")
        }else{
          cleaned_data <- dplyr::filter(ca_strain_df,
                                        ca_strain_df$ISO_WEEK == week)
          ca_strain.long = melt(cleaned_data, id="ISO_YEAR", measure=c("AH1",
                            "AH1N12009", "AH3", "AH5", "ANOTSUBTYPED", "INF_A",
                            "BVIC", "BYAM", "BNOTDETERMINED", "INF_B",
                            "INF_ALL", "INF_NEGATIVE"))
          print(ca_strain.long)
          plot6 <- ggplot(data = ca_strain.long, aes(x=`ISO_YEAR`, y=value)) +
            geom_bar(aes(fill=variable), stat='identity',
                     position = position_dodge()) + xlab("Year") +
            ylab("Number of confirmed cases") +
            guides(fill=guide_legend(title="Strain")) +
            ggtitle(paste("Comparison of 2021 and 2022 number of confirmed
                          influenza cases by strain in week", week))
          return(plot6)
        }
      }
    }else{
      stop("Region is not a valid option for this data type")
    }
  }
}
