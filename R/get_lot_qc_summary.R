get_lot_qc_summary<-function(TYPE,LOT,INST,DB){
  tbl(DB, "wetqc_lot") %>%
    filter(
      cartridgetypeid == local(TYPE),
      Lot == local(LOT),
      Inst == local(INST)
    ) %>%
    collect()
}
