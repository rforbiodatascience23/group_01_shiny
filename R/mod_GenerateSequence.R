#' GenerateSequence UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_GenerateSequence_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' GenerateSequence Server Functions
#'
#' @noRd 
mod_GenerateSequence_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_GenerateSequence_ui("GenerateSequence_1")
    
## To be copied in the server
# mod_GenerateSequence_server("GenerateSequence_1")
