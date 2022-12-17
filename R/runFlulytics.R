#'
#' A Shiny App for NCBI search
#'
#' This function starts a shiny app where the user can choose which parameters
#' they would like to conduct an ncbi search with. The results are outputted for
#' viewing in the console, and are formatted as ncbi record ids.
#'
#' @return Starts shiny app
#' @export
#' @examples
#' runFlulytics()

runFlulytics <- function() {
  fpath <- system.file("shiny-scripts", "app.R", package="Flulytics")

  shiny::runApp(fpath, display.mode = "normal")
  return()
}
