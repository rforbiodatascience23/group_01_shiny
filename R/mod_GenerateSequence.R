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
    fluidRow(
      column(8, shiny::uiOutput(ns("DNA"))),
      column(4, shiny::numericInput(
        inputId = ns("nucleotide_number"),
        value = 6000,
        min = 3,
        max = 100000,
        step = 3,
        label = "Random DNA length"
      ),
      shiny::actionButton(
        inputId = ns("create_dna"),
        label = "Generate random DNA", style = "margin-top: 18px;"
      ))
    ),
    shiny::verbatimTextOutput(outputId = ns("peptide_sequence")) |>
      shiny::tagAppendAttributes(style = "white-space: pre-wrap;")

  )
}

#' GenerateSequence Server Functions
#'
#' @noRd
mod_GenerateSequence_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
    dna <- reactiveVal()

    output$DNA <- renderUI({
      shiny::textAreaInput(
        inputId = ns("DNA"),
        label = "DNA Sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )
    })
    observeEvent(input$create_dna, {
      dna(
        group01package::dna_builder(input$nucleotide_number)
      )
    })

    output$peptide_sequence <- renderText({
      # Ensure input is not NULL and is longer than 2 characters
      if(is.null(input$DNA)){
        NULL
      } else if(nchar(input$DNA) < 3){
        NULL
      } else{
        input$DNA |>
          toupper() |>
          group01package::DNA_to_RNA() |>
          group01package::codon_split() |>
          group01package::codons_concatenation()
      }
    })
  })}

## To be copied in the UI
# mod_GenerateSequence_ui("GenerateSequence_1")

## To be copied in the server
# mod_GenerateSequence_server("GenerateSequence_1")
