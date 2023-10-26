print_specs<-function(IN,X){

  j <-c(">=","<"," & <="," +/-")
  c(
  paste0(j[1],IN$pHLED_avg_low,j[3],IN$pHLED_avg_high),
  paste0(j[2],IN$pHLED_avg_cv_high),
  paste0(j[1],IN$O2LED_avg_low,j[3],IN$O2LED_avg_high),
  paste0(j[2],IN$O2LED_avg_cv_high),
  paste0(round(X$mean_avg_Gain,3) ,j[4],round(.1*X$mean_avg_Gain,4)),
  paste0(j[2],IN$Gain_cv_high),
  paste0(round(X$mean_avg_KSV,4),j[4],round(.1*X$mean_avg_KSV,6)),
  paste0(j[2],IN$ksv_csv_high)
  )
}
