ui <- function(){
  library(shiny)
  fluidPage(
    titlePanel("QC Data Summary"),

    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "type",
          label = "cartridge type",
          choices = c("W" = 3, "C" = 8, "B" = 5),
          selected = NULL,
          multiple = FALSE,
          selectize = TRUE
        ),
        selectInput(
          inputId = "lots",
          label = "cartridge lot",
          choices = NULL
        ),
        selectInput(
          inputId = "Instr",
          label = "QC instrument",
          choices = NULL
        ),
        actionButton("do", "compile"),
        downloadButton('downloadSummary', 'Download Summary')
      ),
      mainPanel(
        DT::dataTableOutput('INFO'),
        DT::dataTableOutput('SUMMARY')
      )
    )
  )
}
