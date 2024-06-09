testdf <- function(variable, max.augmentations)	{
  
  #require(fUnitRoots)
  #require(lmtest)
  
  results_adf <- data.frame(augmentations = -1, adf = 0, p_adf = 0, bgodfrey = 0, p_bg = 0)
  variable    <- coredata(variable)
  variable    <- as.numeric(variable)
  variable    <- variable[!is.na(variable)]
  
  for(augmentations in 0:max.augmentations) {
    df.test  <- fUnitRoots::adfTest(variable, lags = augmentations, type = "c")
    df       <- as.numeric(df.test@test$statistic)
    p_adf    <- as.numeric(df.test@test$p.value)
    resids   <- df.test@test$lm$residuals
    bgtest   <- lmtest::bgtest(resids ~ 1, order = 1)
    bgodfrey <- bgtest$statistic
    names(bgodfrey) <- NULL
    p_bg     <- bgtest$p.value
    
    results_adf <- 
      rbind(results_adf, 
            data.frame(augmentations = augmentations, 
                       adf      = df, 
                       p_adf    = p_adf,
                       bgodfrey = bgodfrey, 
                       p_bg     = p_bg))
  }
  
  results_adf <- results_adf[results_adf$augmentations >= 0, ]
  row.names(results_adf) <- NULL
  
  # for the basic graphics:
  if (0) plot(variable, type = "l", col = "darkblue", lwd = 1, main = "Plot of the examined variable")
  
  # for ggplot2 graphics:
  p <- 
    tibble(y = variable) %>%
    mutate(obs = row_number()) %>%
    ggplot(aes(obs, y)) +
    geom_line(col = "royalblue3") +
    theme_bw() +
    labs(title = "Plot of the examined variable") 
  p %>% print()
  
  return(results_adf)
}	
