#' Transcription_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Transcription_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, shiny::sidebarPanel(
        shiny::verbatimTextOutput(
        outputId = ns("RNA"),

      ),
      width = 600)),
      column(4, shiny::textAreaInput(
          inputId = ns("DNA"),
          label = "DNA sequence",
          width = 300,
          height = 100,
          placeholder = "Insert DNA sequence"
        )
      )
    )
  )
}




#' Transcription_module Server Functions
#'
#' @noRd
mod_Transcription_module_server <- function(id, input_dna){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    rna = ""
    output$RNA <- reactive({
      if(input$DNA == ""){

      } else{
        rna <- input$DNA %>%
          centralDogma::transcribe()
        rna
      }
    })
  return(rna)
  })
}











## To be copied in the UI
# mod_Transcription_module_ui("Transcription_module_1")

## To be copied in the server
# mod_Transcription_module_server("Transcription_module_1")
