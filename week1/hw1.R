setwd("C:/workspace-programming-r/quiz1_data")

## hw1.4
x <- 4
class(x)
#[1] "numeric"

## hw1.5
x <-c(4,'a', TRUE)
class(x)

## hw1.6
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x,y)
#> rbind(x,y)
#[,1] [,2] [,3]
#x    1    3    5
#y    3    2   10
#> class(rbind(x,y))
#[1] "matrix"

## hw1.8
x <- list(2, "a", "b", TRUE)
x[[2]]
#> x <- list(2, "a", "b", TRUE)
#> x[[2]]
#[1] "a"
#> class(x[[2]])
#[1] "character"

## hw1.9
x <- 1:4
y <- 2
x + y
class(x + y)
#> x + y
#[1] 3 4 5 6
#> class(x + y)
#[1] "numeric"

## hw1.10
x <- c(17, 14, 4, 5, 13, 12, 10)
#> x[x>10] <- 4
#> x[x>=11] <- 4
#> x
#[1]  4  4  4  5  4  4 10

## hw1.11
mydata = read.csv("hw1_data.csv")
colnames(mydata)

## hw1.12
mydata[1:2,]
#> mydata[1:2,]
#Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2

## hw1.13
df <- data.frame(mydata)
nrows <- nrow(df)
nrows
#> df <- data.frame(mydata)
#> nrows <- nrow(df)
#> nrows
#[1] 153

## hw1.14
df[152:153,]
#> df[152:153,]
#Ozone Solar.R Wind Temp Month Day
#152    18     131  8.0   76     9  29
#153    20     223 11.5   68     9  30

## hw1.15
df[47, "Ozone"]
#> df[47, "Ozone"]
#[1] 21

## hw1.16
df1 <- df[,1:1]
df1
# ... does not work
# complete.cases(df1)
# ... does not work
#apply(df, 1, function(x) length(which(!is.na(x))))
colSums(is.na(df), 1)
#> colSums(is.na(df),1)
#Ozone Solar.R    Wind    Temp   Month     Day 
#37       7       0       0       0       0 

## hw1.17
colMeans(!is.na(df), 1)
#> colMeans(!is.na(df), 1)
#Ozone   Solar.R      Wind      Temp     Month 
#0.7581699 0.9542484 1.0000000 1.0000000 1.0000000 
#Day 
#1.0000000 

mean(!is.na(df[["Ozone"]]))
#> mean(!is.na(df[["Ozone"]]))
#[1] 0.7581699

df[is.numeric(df$value), c("Ozone")]


# http://www.r-bloggers.com/select-operations-on-r-data-frames/
# i.e., where is in first arg
# i.e., from is in second arg

## hw1.18
df1 <- df[,c("Ozone", "Temp", "Solar.R")]

## hw1.19
df1 <- df[,c("Temp", "Month")]

## hw1.20
df1 <- df[,c("Ozone", "Month")]
