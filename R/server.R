server <- function(input, output, session) {
  library(shiny)

  E <- new.env()
  db <- adminKraken::con_dplyr()

  lot_list <- reactive({
    rel2::get_order_lots(input$type, db)
  })

  observeEvent(input$type, {
    E$LOTLIST <- lot_list()

    updateSelectInput(
      session = session,
      inputId = 'lots',
      choices = E$LOTLIST$Lot,
      selected = E$LOTLIST$Lot[1]
    )
  })

  observeEvent(input$lots, {
    LOT <- input$lots
    updateSelectInput(
      session = session,
      inputId = 'Instr',
      choices = E$LOTLIST$Inst[E$LOTLIST$Lot == input$lots],
      selected = NULL
    )
    output$SUMMARY  <- DT::renderDataTable({
    })
    output$INFO <- DT::renderDataTable({
    })
  })

  observeEvent(input$do, {
    s <- rel2::get_specs(as.integer(input$type), db)
    X <- rel2::get_lot_qc_summary(input$type, input$lots, input$Instr, db)
    S <- filter(s, cartridgetypeid == input$type)
    Y <- rel2::gets_matrix_data(input$type, input$lots, db) %>%
      mutate(Gain = (PH_A * PH_B) + PH_C)

    E$RMD <- rel2::create_rmd(input$type, input$lots, input$Instr)
    E$SUMMARY <- rel2::generate_summary_df(S, X, Y)
    E$INFO <- rel2::get_info_df(Y, input$Instr)

    output$SUMMARY <-  DT::renderDataTable({
      E$SUMMARY
    }, options = list(
      dom = 't',
      ordering = F,
      pageLength = 11
    ), rownames = FALSE, filter = "none")

    output$INFO <- DT::renderDataTable({
      E$INFO
    },
    options = list(
      dom = 't',
      ordering = F,
      pageLength = 11
    ), rownames = FALSE, filter = "none",
    caption = paste0("Cartridge Production Lot: ",
                     paste0(Y$Type, Y$`Lot Number`)))
  })
  #####
  output$downloadSummary <- downloadHandler(
    filename = function() {
      a <- c("W" = 3, "C" = 8, "B" = 5)
      whch<-names(a[a==input$type])
      paste0("RFS_",whch,
             input$lots,
             "_QCinstrument-",
             input$Instr,"_",
             Sys.Date(),
             ".pdf")
    },
    content = function(file) {
      temp_rmd <- tempfile(fileext = ".rmd")
      writeLines(E$RMD, temp_rmd)
      # Render to PDF
      rmarkdown::render(temp_rmd,
                        output_format = "pdf_document",
                        output_file = file)
    }
  )
  #####
}
