#' Plotting module UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList

mod_Plotting_module_ui <- function(id){
  ns <- NS(id)
  tagList()
}

#' Plotting module Server Functions
#'
#' @noRd
mod_Plotting_module_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_Plotting_module_ui("Plotting module_1")

## To be copied in the server
# mod_Plotting_module_server("Plotting module_1")
