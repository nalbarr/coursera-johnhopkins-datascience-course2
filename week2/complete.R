# complete <- function(directory, ids = 1:332) {
#   to_csv_filename <- function(id) {
#     sprintf("%03d.csv", id)
#   }
#   
#   filenames <-  vector(mode="character",length=length(ids))
#   for (id in seq_along(ids)) {
#     filenames[id] <- sprintf("%s/%s", directory, to_csv_filename(id))
#   }  
# 
#   nobs <- vector(mode="integer", length=length(ids))
#   for (i in seq_along(nobs)) {
#     df <- read.csv(filenames[i])
#     completes <- complete.cases(df)
#     df <- df[completes,]
#     nobs[i] <- nrow(df)
#   }
#   df2 <- data.frame(i, nobs)
#   df2
# }

#https://github.com/lisalisadong/data-science/blob/master/r-programming/excercises/assignment1/corr.R
complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  nobs <- numeric(0)
  for (i in id) {
    csv <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep = ""))
    good <- complete.cases(csv)
    nobs <- c(nobs, nrow(csv[good, ]))
  }
  data.frame(id = id, nobs = nobs)
}