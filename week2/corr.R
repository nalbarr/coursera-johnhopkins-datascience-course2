# corr <- function(directory, threshold = 0) {
#   to_csv_filename <- function(id) {
#     sprintf("%03d.csv", id)
#   }
#   
#   ids <- 1:332
#   filenames <-  vector(mode="character", length = length(ids))
#   for (id in seq_along(ids)) {
#     filenames[id] <- sprintf("%s/%s", directory, to_csv_filename(id))
#   }
#   
#   corrs <- vector(mode="numeric", length = 0)
#   
#   for(id in seq(filenames)) {
#     print(filenames[id])
#     df <- read.csv(filenames[id])
#     completes <- complete.cases(df)
#     df <- df[completes,]
#     print(nrow(df))
#     if (nrow(df) > threshold) {
#       corr <- cor(df[["sulfate"]], df[["nitrate"]])
#       corrs <- append(corrs, corr)
#     }
#     corrs
#   }
# }

#https://github.com/lisalisadong/data-science/blob/master/r-programming/excercises/assignment1/corr.R
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  source("complete.R")
  complete <- complete(directory)
  meet <- complete["nobs"] > threshold
  valid <- complete[meet, ]
  correlation <- numeric(0)
  for (i in valid$id) {
    csv <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep = ""))
    good <- complete.cases(csv)
    data <- csv[good, ]
    correlation <- c(correlation, cor(data["sulfate"], data["nitrate"]))
  }
  correlation
}

