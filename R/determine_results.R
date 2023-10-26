determine_results<-function(S,X,Y){
  c(
    X$mean_avg_pHLED >= S$pHLED_avg_low &
      X$mean_avg_pHLED <= S$pHLED_avg_high,
    X$cv_avg_PHLED <= S$pHLED_avg_cv_high,
    X$mean_avg_O2LED >= S$O2LED_avg_low &
      X$mean_avg_O2LED <= S$O2LED_avg_high,
    X$cv_avg_O2LED <= S$O2LED_avg_cv_high,
    X$mean_avg_Gain  >= (.9 * Y$Gain) &&
      X$mean_avg_Gain <= (1.1 * Y$Gain),
    X$cv_avg_Gain <= S$Gain_cv_high,
    X$mean_avg_KSV >= (Y$O2_B * .9) &&
      X$mean_avg_KSV <= (Y$O2_B * 1.1),
    X$cv_avg_KSV <= S$ksv_csv_high
  )
}
