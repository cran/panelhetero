## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width  = 7, 
  fig.height = 5 
)
options(rmarkdown.html_vignette.check_title = FALSE)

## ----setup, include = FALSE---------------------------------------------------
library(panelhetero)
library(ggplot2)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages("panelhetero")
#  library(panelhetero)

## ---- eval = FALSE------------------------------------------------------------
#  # install.packages("devtools") # if necessary
#  # install.packages("ggplot2")  # if necessary
#  devtools::install_github("tkhdyanagi/panelhetero", build_vignettes = TRUE)
#  library(panelhetero)

## ---- eval = TRUE-------------------------------------------------------------
set.seed(1)
y <- panelhetero::simulation(N = 300, S = 8)

## ---- eval = TRUE-------------------------------------------------------------
result1 <- hpjmoment(data = y, acov_order = 0, acor_order = 1)
result1$estimate
result1$se
result1$ci

## ---- eval = TRUE-------------------------------------------------------------
result2 <- hpjecdf(data = y,
                   acov_order = 0, 
                   acor_order = 1,
                   R = 100,
                   ci = FALSE)
result2$mean

## ---- eval = TRUE-------------------------------------------------------------
result3 <- hpjkd(data = y, acov_order = 0, acor_order = 1)
result3$mean

## ---- eval = TRUE-------------------------------------------------------------
result3$mean + 
  ggtitle("") + 
  theme_classic()

## ---- eval = TRUE-------------------------------------------------------------
ggplot(data = data.frame(x = c(-3.5, 3.5)), aes(x = x)) + 
  stat_function(fun = result3$mean_func) + 
  ggtitle("")

