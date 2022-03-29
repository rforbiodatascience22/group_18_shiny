#' Translation_module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Translation_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, shiny::sidebarPanel(
        shiny::verbatimTextOutput(
          outputId = ns("peptide")
      ),
      width = 600)),
      column(4, shiny::textAreaInput(
          inputId = ns("rna"),
          label = "RNA sequence",
          width = 300,
          height = 100,
          placeholder = "Insert RNA sequence"
        )
      )
    )
  )
}

#' Translation_module Server Functions
#'
#' @noRd
mod_Translation_module_server <- function(id, input_rna){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    rna_sub = ""
    output$peptide <- reactive({
      if(input$rna == ""){

      } else{
        rna_sub <- input$rna %>%
          centralDogma::codon_split()%>%
            centralDogma::translate()
        rna_sub
      }
    })
  return(rna_sub)
  })
}

## To be copied in the UI
# mod_Translation_module_ui("Translation_module_1")

## To be copied in the server
# mod_Translation_module_server("Translation_module_1")
