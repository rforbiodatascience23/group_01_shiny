#' Plotting module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom ggplot2 theme
#' @import group01package

mod_Plotting_module_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
          inputId = ns("peptide_sequence"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
        )
      ),
      shiny::mainPanel(
        shiny::plotOutput(
          outputId = ns("amount_aa")
        )

      )
    )
  )
}

#' Plotting module Server Functions
#'
#' @noRd
mod_Plotting_module_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    output$amount_aa <- renderPlot({
      if(input$peptide_sequence == ""){
        NULL
      } else{
        input$peptide_sequence |>
          group01package::plot_by_aminoacid_count() +
          ggplot2::theme(legend.position = "none")
      }
    })
  })
}
## To be copied in the UI
# mod_Plotting_module_ui("Plotting module_1")

## To be copied in the server
# mod_Plotting_module_server("Plotting module_1")
