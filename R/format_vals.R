format_vals<-function(u){
  as.character(c(
    round(u$mean_avg_pHLED, 0) ,
    round(u$cv_avg_PHLED, 1),
    round(u$mean_avg_O2LED, 0),
    round(u$cv_avg_O2LED, 2),
    round(u$mean_avg_Gain, 3),
    round(u$cv_avg_Gain, 2),
    round(u$mean_avg_KSV, 6),
    round(u$cv_avg_KSV, 2)
  ))
}
