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
  DNA <- reactiveVal()
  dna_output <- mod_Input_module_server("Input_module_1")
  RNA <- reactiveVal()

  rna_sub_output <- mod_Transcription_module_server("Transcription_module_1", dna_output)

  peptide <- reactiveVal()
  rna_output <- mod_Translation_module_server("Translation_module_1", rna_sub_output)

  mod_Plotting_module_server("Plotting_module_1", rna_output)

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
