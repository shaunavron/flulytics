#' #' Converts Fahrenheit to Celsius
#' #'
#' #' This function converts input temperatures in Fahrenheit to Celsius.
#' #' @param temp_F The temperature in Fahrenheit.
#' #' @return The temperature in Celsius.
#' #' @export
#' #' @examples
#' #' fahrenheit_to_kelvin(32)
#'
#' library(shiny)
#' ui <- fluidPage(
#'   # Application title
#'   titlePanel("Plotting tool"),
#'   sidebarLayout(
#'     sidebarPanel(
#'       selectInput(inputId = "Type",
#'                   label = "Select data type to plot:",
#'                   choices = c("imm","CA_flu","CA_strains"),
#'                   selected = NULL,
#'                   multiple = FALSE,
#'                   selectize = TRUE,
#'                   width = NULL,
#'                   size = NULL),
#'       textInput(inputID = "Week",
#'                  label = "Enter a valid week, for CA_flu weeks 202235 to 202248 are available, for CA_strains weeks 1 to 52 are available:",
#'                  value = "",
#'                  width = NULL,
#'                  placeholder = NULL),
#'       textInput(inputID = "Year",
#'                 label = "Enter a valid year (only available for CA_strains):",
#'                 value = "",
#'                 width = NULL,
#'                 placeholder = NULL),
#'       textInput(inputID = "Region",
#'                 label = "Enter a valid region (only available for CA_flu):",
#'                 value = "",
#'                 width = NULL,
#'                 placeholder = NULL)
#'     ), mainPanel = plotOutput(outputId = plot)))
#'
#' # Run the application
#' shinyApp(ui = ui, server = server)
#'

library(ggplot2)
library(readxl)
library(shiny)



ui <- fluidPage(
  titlePanel("Plotting Tool"),
  sidebarPanel(
    selectInput(inputId = "Type", "Select data to plot", choices =
                  c("imm","CA_flu","CA_strains")),
    textInput(inputId ="Week", 'Enter a valid week:', value = ""),
    textInput(inputId = "Year", 'Enter a valid year:', value = ""),
    textInput(inputId = "Region", 'Enter a valid region:', value = "")),
  plotOutput("plot")
)



server <- function(input, output){
  output$plot <- renderPlot({plot_data(input$Type, input$Week, input$Year, input$Region)
  })
}

shinyApp(ui = ui, server = server)
