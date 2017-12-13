## Caching the Inverse of a Matrix
## 

## Function:  makeCacheMatrix
## Creates a specialized extended matrix data type with additional functions to support accessor functions
## to support caching.
## Args:
## - matrix
## Returns: 
## - list of accessor functions as set, get, setmatrix, getmatrix
## Error handling
## - None.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}

## Function:  cacheSolve
## Creates a specialized extended matrix data type with additional functions to support accessor functions
## to support caching.
## Args:
## - cahematrix as a list of functions
## Returns: 
## - matrix
## Error handling
## - Input matrix results in undeteriminant inverse function.  Guard against divide by zero.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  if (det(data) != 0) {
    m <- solve(data, ...)
    x$setmatrix(m)
  } else {
    message("Can not solve determinant of input matrix returns zero.")
  }
  m  
}
