create_rmd <-
function(TYPE,LOT,INST){
    gsub("%type%",TYPE,
         gsub("%lot%",LOT,
              gsub("%inst%",INST,
                   rmd_template()
              ))
    )
}
