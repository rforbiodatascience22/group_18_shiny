#' Input_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Input_module_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' Input_module Server Functions
#'
#' @noRd 
mod_Input_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Input_module_ui("Input_module_1")
    
## To be copied in the server
# mod_Input_module_server("Input_module_1")
