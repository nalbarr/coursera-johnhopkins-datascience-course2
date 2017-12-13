makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

cachemean <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- mean(data, ...)
  x$setmean(m)
  m
}

# experimentation
# all calls today FAIL since i had incorrely thought i was pass cachemean into makeVector
# 1. issue:  initial inverted the calls but 
# 2. concept that was needed to realiz makevector
# - creates a higher kinded type with a accessor to list of functions
# - has type constructor using a input vector
# 3. cachemean is a memoization function that takes higher kinded type as input
# - input is list of function wrapped as specialized vector type
mean <- cachemean(makeVector$set(v1))
mean <- cachemean$getmean
class(helper)
class(helper$get())

helper <- makeVector$setmean(cachemean)
helper$set(v1)
helper$setmean(cachemean)
mean <- makeVector$getmean

# solution:
# 1. create specialized vector type
# 2. pass higher kinded type to cachemean function
# 3. call it multiple times to verify caching
v1values <- c(1, 3, 1, 3)
# type constructor
v1 <- makeVector(v1values)
# setter
v1 <- makeVector$set(v1values)
v1$get()
v1$getmean()

mean <- cachemean(v1)
#> mean
#[1] 2

mean2 <- cachemean(v1)
mean2
#getting cached data
#> mean2
#[1] 2