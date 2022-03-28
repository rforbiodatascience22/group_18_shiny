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
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
          inputId = ns("DNA"),
          label = "DNA sequence",
          width = 300,
          height = 100,
          placeholder = "Insert DNA sequence"
        )
      )
    ,
    shiny::mainPanel(
      shiny::verbatimTextOutput(
        outputId = ns("RNA")
      )
    )
  )
)
}




#' Transcription_module Server Functions
#'
#' @noRd
mod_Transcription_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$RNA <- renderPrint({
      if(input$DNA == ""){
        NULL
      } else{
        print("mRNA sequence : ")
        input$DNA %>%
          centralDogma::transcribe()
      }
    })
  })
}











## To be copied in the UI
# mod_Transcription_module_ui("Transcription_module_1")

## To be copied in the server
# mod_Transcription_module_server("Transcription_module_1")
