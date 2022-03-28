#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom magrittr %>%
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  dna <- reactiveVal()

  mod_Input_module_server("Input_module_1")
  RNA <- reactiveVal()

  mod_Transcription_module_server("Transcription_module_1")

  peptide <- reactiveVal()
  mod_Translation_module_server("Translation_module_1")

  mod_Plotting_module_server("Plotting_module_1")

}

#' @importFrom shiny NS tagList
mod_nucleus_ui <- function(id){
  ns <- NS(id)
  tagList(

  )
}

#' nucleus Server Functions
#'
#' @noRd
mod_nucleus_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}
