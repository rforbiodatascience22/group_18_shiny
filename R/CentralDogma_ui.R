#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      h1("myshinyapp"),
      tabsetPanel(
        tabPanel(title = "DNA Input",
                 mod_Input_module_ui("Input_module_1")),
        tabPanel(title = "RNA Input",
                 mod_Transcription_module_ui("Transcription_module_1")),
        tabPanel(title = "peptide Input",
                 mod_Translation_module_ui("Translation_module_1")),
        tabPanel(title = "Plot",
                 mod_Plotting_module_ui("Plotting_module_1"))

      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Central Dogma "
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

