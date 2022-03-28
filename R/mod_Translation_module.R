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
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
          inputId = ns("rna"),
          label = "RNA sequence",
          width = 300,
          height = 100,
          placeholder = "Insert RNA sequence"
        )
      )
      ,
      shiny::mainPanel(
        shiny::verbatimTextOutput(
          outputId = ns("peptide")
        )

      )
    )
  )
}

#' Translation_module Server Functions
#'
#' @noRd
mod_Translation_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$peptide <- renderPrint({
      if(input$rna == ""){
        NULL
      } else{
        print("Peptide sequence : ")
        input$rna %>%
          centralDogma::codon_split()%>%
            centralDogma::translate()
      }
    })
  })
}

## To be copied in the UI
# mod_Translation_module_ui("Translation_module_1")

## To be copied in the server
# mod_Translation_module_server("Translation_module_1")
