#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
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
