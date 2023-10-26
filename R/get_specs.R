get_specs <- function(TYPE, DB) {
  tbl(DB, "wqcspecs")  %>% collect()
}
