get_order_lots<-function(TYPE,db){
  tbl(db, "wetqc_lot") %>%
    filter(cartridgetypeid == local(TYPE)) %>%
    select(Inst, Lot) %>%
    distinct() %>%
    collect() %>%
    mutate(year = as.numeric(substr(Lot, 4, 5)),
           day = as.numeric(substr(Lot, 1, 3))) %>%
    arrange(desc(year), desc(day))
}
