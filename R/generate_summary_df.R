generate_summary_df <- function(S,X,Y) {
  tibble(
    Attributes = c(
      "pH LED Average" ,
      "pH LED CV" ,
      "O2 LED Average" ,
      "O2 LED CV" ,
      "pH Gain Average" ,
      "pH Gain CV" ,
      "KSV Average" ,
      "KSV CV"
    ),
    Values = format_vals(X),
    specifications = print_specs(S, X),
    Result = c("Fail", "Pass")[factor(determine_results(S, X, Y), level = c(F, T))]
  )
}
