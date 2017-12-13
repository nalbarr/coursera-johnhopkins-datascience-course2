# q4.1
set.seed(1)
rpois(5, 2)

# q4.8
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)

setwd("C:/workspace-programming-r")
source("./week4/week4.R")

