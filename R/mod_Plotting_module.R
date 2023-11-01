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
          inputId = ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
        ),
        shiny::actionButton(
          inputId = ns("peptide"),
          label = "Plot", style = "margin-top: 18px;"
        )
      ),
      shiny::mainPanel(
        shiny::plotOutput(
          outputId = ns("abundance")
        )

      )
    )
  )
}

#' Plotting module Server Functions
#'
#' @noRd
mod_Plotting_module_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    observe({
      if (input$peptide == "") {
        output$abundance <- renderPlot(NULL)
      } else {
        plot_data <- group01package::plot_by_aminoacid_count(input$peptide)

        output$abundance <- renderPlot({
          ggplot2::ggplot(data = plot_data) +
            # Add your plot specifications here
            ggplot2::theme(legend.position = "none")
        })
      }
    })
  })
}
#mod_Plotting_module_server <- function(id){
 # moduleServer(id, function(input, output, session){
  #  ns <- session$ns
   # output$abundance <- renderPlot({
    #  if(input$peptide == ""){
     #   NULL
      #} else{
      #  input$peptide |>
       #   group01package::plot_by_aminoacid_count() +
        #  ggplot2::theme(legend.position = "none")
      #}
    #})
  #})
#}

## To be copied in the UI
# mod_Plotting_module_ui("Plotting module_1")

## To be copied in the server
# mod_Plotting_module_server("Plotting module_1")
