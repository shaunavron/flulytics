#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

ui <- fluidPage(
  titlePanel("NCBI SEARCH"),
  sidebarPanel(
    selectInput(inputId = "Search_term", "Choose one of the following:",
                choices = c("AH1","AH1N12009", "AH3", "AH5", "INF_A", "BVIC",
                            "BYAM", "INF_B")),
    selectInput(inputId = "Database",
                "Select database you would like to search",
                choices = c("annotinfo", "assembly", "biocollections",
                            "bioproject", "biosample", "blastdbinfo", "books",
                            "cdd", "clinvar", "dbvar", "gap", "gapplus", "gds",
                            "gene", "genome", "geoprofiles", "grasp", "gtr",
                            "homologene", "ipg", "medgen", "mesh", "nlmcatalog",
                            "nuccore", "nucleotide", "omim", "orgtrack",
                            "pcassay", "pccompound", "pcsubstance", "pmc",
                            "popset", "protein", "proteinclusters", "protfam",
                            "pubmed", "seqannot", "snp", "sra", "structure",
                            "taxonomy")),
    selectInput(inputId = "Links", "Show related links to all other databases?",
                choices = c("TRUE", "FALSE")),
    mainPanel(dataTableOutput("table"))
  ),
  actionButton("Go", "Search")
)



server <- function(input, output){
  observeEvent(input$Go, {
    output$table <- renderDataTable({ ncbi_search(input$Search_term,
                                                  input$Database, input$Links)
      showNotification("Check the console for your results!")
    })
  })
}

shinyApp(ui = ui, server = server)

