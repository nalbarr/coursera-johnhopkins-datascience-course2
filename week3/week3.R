
# lapply
xs <- list(a = 1:5, b = rnorm(10))
means <- lapply(xs, mean)
# return of list of list of ints with length 1
class(means)
means

# sapply
xs <- list(a = 1:5, b = rnorm(10))
means <- sapply(xs, mean)
# return vector of ints (i.e., numeric)
class(means)
means

# apply
xs <- matrix(rnorm(20), 2, 10)
means <- apply(xs, 2, mean)
class(means)
means

xs <- matrix(rnorm(20), 2, 10)
sums <- apply(xs, 1, sum)
sums
class(sums)


# fp experimentation
xs <- 1:5
class(xs)
ids <- seq_along(xs)
class(ids)

squares <- function(xs) {
  square <-function(x) {
    x^2
  }
  if (length(x) == 1) {
    square(head(xs, 1))
  } else {
    xs <- tail(xs, length(xs) - 1)
    squares(xs)
  }
}
xs <- 1:2
squares(xs)

# this does not work
#lapply(xs, square(x) )
# this does
lapply(xs, square, head(xs))

df1 <- data.frame(1, "2", 3.0)
df2 <- data.frame(4, "5", 6.0)

to_filecsv <- function(n) {
  sprintf("%03d", n)
}

f1name <- to_filecsv(1)
f1name

dfadd <- function(df, to_filescsv) {
  
}

# quiz 3
library(datasets)
data(iris)
?iris

# quiz 3.1
irissplitspecies <- split(iris, iris$Species)
length(irissplitspecies)
class(irissplitspecies)
colsbyvirginica <- irissplitspecies$virginica
length(colsbyvirginica)
col1byvirginica <- colsbyvirginica$Sepal.Length
class(col1byvirginica)
length(col1byvirginica)
class(col1byvirginica)
# does not work needs matrix
#apply(col1byvirginica, 2, mean)
mean(col1byvirginica)

#> mean(col1byvirginica)
#[1] 6.588
# round to 7

# quiz 3.2
#colMeans(iris) - eliminate
#apply(iris, 1, mean) - eliminate
#apply(iris[,1:4], 1, mean) - elimate, this is all rows
apply(iris[,1:4], 2, mean)

# quiz 3.3
library(datasets)
data(mtcars)
?mtcars
# missed
with(mtcars, tapply(mpg, cyl, mean)) 
# missed
tapply(mtcars$mpg, mtcars$cyl, mean) 
#lapply(mtcars, mean) - eliminate, list of lists
#apply(mtcars, 2, mean) - eliminate, not grouped by number of cyl
#tapply(mtcars$cyl, mtcars$mpg, mean) - eliminate, not average mean
#mean(mtcars$mpg, mtcars$cyl) -- eliminate, error !
#sapply(mtcars, cyl, mean) -- eliminate, error
#split(mtcars, mtcars$cyl) -- eliminate, does not compute mean
sapply(split(mtcars$mpg, mtcars$cyl), mean)

# quiz 3.4
mtcarssplitbycyl <- split(mtcars, mtcars$cyl)
mtcarssplitby4cyl <-mtcarssplitbycyl$'4'
mtcarssplitby8cyl <-mtcarssplitbycyl$'8'
absdiff <- abs(mean(mtcarssplitby4cyl[,4]) - mean(mtcarssplitby8cyl[,4]))
absdiff
#> absdiff
#[1] 126.5779
# round to 127





















































































































