# pollutantmean <- function(directory, pollutant, ids) {
# 
#     to_csv_filename <- function(id) {
#     sprintf("%03d.csv", id)
#   }
#   for (id in seq_along(ids)) {
#     f <- sprintf("%s/%s", directory, to_csv_filename(id))
#     dfs <- read.csv(f)
#     if (id > 1) {
#       dfs <- append(dfs, df)
#     }
#   }
#   if (pollutant == "sulfate") {
#     # does not work, wrong type
#     # colMeans(completes, TRUE, 1)
#     sulfates <- dfs["sulfate"]
#     completes <- sulfates[complete.cases(sulfates), ]
#   } else if (pollutant == "nitrate") {
#     nitrates <- dfs["nitrate"]
#     completes <- nitrates[complete.cases(nitrates), ]
#   } else {
#     print("Exception.  Unknown pollutant type.")
#   }
#   mean(completes)
# }

# pollutantmean <- function(directory, pollutant, ids) {
#   to_csv_filename <- function(id) {
#     sprintf("%03d.csv", id)
#   }
#   
#   filenames <-  vector(mode="character",length=length(ids))
#   for (id in seq_along(ids)) {
#     filenames[id] <- sprintf("%s/%s", directory, to_csv_filename(id))
#   }  
#   
#   accumulator <- 0
#   total <- 0  
#   for(id in filenames) {
#     df <- read.csv(id)
#     completes <- complete.cases(df[pollutant])
#     df <- df[completes, ]
#     total <- total + nrow(df)
#     accumulator <- accumulator + sum(df[[pollutant]], na.rm = TRUE)
#   }
#   mean <-accumulator/total
#   mean
# }

#https://github.com/lisalisadong/data-science/blob/master/r-programming/excercises/assignment1/pollutantmean.R
pollutantmean <- function(directory, pollutant, ids = 1:332) {
  data <- NA
  for (i in ids) {
    csv <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep = ""))
    data <- rbind(data, csv)
  }
  mean(data[[pollutant]], na.rm = TRUE)
}