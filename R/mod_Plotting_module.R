#' Plotting_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Plotting_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, shiny::plotOutput(
        outputId = ns("abundance")
      )),
      column(4,
        shiny::textAreaInput(
          inputId = ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
          )
        )
      )
    )
}






#' Plotting_module Server Functions
#'
#' @noRd
mod_Plotting_module_server <- function(id, input_rna_sub){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide %>%
          centralDogma::plot_abundance() +
          ggplot2::theme(legend.position = "none")
      }
    })
  })
}

## To be copied in the UI
# mod_Plotting_module_ui("Plotting_module_1")

## To be copied in the server
# mod_Plotting_module_server("Plotting_module_1")
