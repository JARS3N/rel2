gets_matrix_data<-function(TYPE,LOTS,DB){
  tbl(DB, "cartridgetype") %>%
    filter(cartridgetypeid == local(TYPE)) %>%
    select(Type = typename, cartridgetypeid) %>%
    left_join(
      .,
      tbl(DB, 'lotview') %>%
        filter(`Lot Number` == local(LOTS)) %>%
        rename(ID = `Barcode Matrix ID`)
    ) %>%
    left_join(., tbl(DB, "barcodematrixview")) %>%
    collect()
}
