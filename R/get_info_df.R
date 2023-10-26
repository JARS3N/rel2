get_info_df<-function(Y,INST){
tibble(
  `MultiFlour Batch` = Y$Multifluor,
  `pH Flourophore` = Y$`pH Fluor`,
  `O2 Flourophore` = Y$`Ox Fluor`,
  `QC Instrument` = INST,
  `Production Date` = lubridate::date(Y$`Lot Date`)
)}
