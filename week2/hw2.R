# hw2.R

# helper: format csv file name
to_csv_filename(1)
#[1] "001.csv"

# experiments merge datasets
directory <- "./specdata"
for (id in seq_along(1:10)) {
  f <- sprintf("%s/%s", directory, to_csv_filename(id))
  dfs <- read.csv(f)
  if (id > 1) {
    dfs <- merge(dfs, df)
  }
}
dfs

# experiment:  need to match test data and mean calculation
# NOTE: below removes NA values correctly
dfs <- read.csv("./specdata/023.csv")
str(dfs)
df <- dfs["nitrate"]
str(df)
completes <- df[complete.cases(df), ]
mean(completes)
#> mean(completes)
#[1] 1.280833

dir <- "specdata"
pollutant <- "nitrate"
ids <- 23
mean <- pollutantmean(dir, pollutant, ids)
mean

## hw2.1

### hw2.1.1
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064

### hw2.1.2
source("pollutantmean.R")
pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706

### hw2.1.3
source("pollutantmean.R")
pollutantmean("specdata", "nitrate", 23)
## [1] 1.281

## hw2.2

### hw2.2.1
source("complete.R")
complete("specdata", 1)

### hw2.2.2
source("complete.R")
complete("specdata", c(2, 4, 8, 10, 12))

source("complete.R")
complete("specdata", 30:25)

source("complete.R")
complete("specdata", 3)

df <- read.csv("specdata/003.csv")
nrow(df)
completes <- complete.cases(df)
completes
df <- df[completes,]
nrow(df)

source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)

source("complete.R")
complete("specdata", 1)
##   id nobs
## 1  1  117
complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
complete("specdata", 3)
##   id nobs
## 1  3  243

source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
cr <- corr("specdata", 400)
head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
cr <- corr("specdata", 5000)
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
length(cr)
## [1] 0
cr <- corr("specdata")
summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
length(cr)
## [1] 323