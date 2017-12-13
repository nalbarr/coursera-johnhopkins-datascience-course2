### cachematrixtest.R

### This is a hw3 programming assignment test scripts.

# A matrix:
# 1. used for test data
# 2. will be able to test matrix algebra functions for: determinant and inverse
col1 <- c(1, 1, 4)
col2 <- c(0, 3, 1)
col3 <- c(4, 4, 0)
df1 <- data.frame(col1, col2, col3)
df1
A <- data.matrix(df1)
A
A[1,1]

# B matrix
col3 <- c(3, 5, 1)
col4 <- c(6, 2, 2)
col5 <- c(3, 1, 1)
df2 <- data.frame(col3, col4, col5)
df2
B <- data.matrix(df2)
B
B[1, 1]

# determinant of A matrix
detA <- det(A)
detA

# inverse of A matrix
inverseA <- solve(A)
inverseA

# determinant of B matrix
#  det(B) is zero
detB <- det(B)
detB

# inverse of B matrix
inverseB <- solve(B)
inverseB

# HW# unit tests for
# 1. makeCacheMatrix
# 2. cacheSolve
# 1. Matrix A will solve
# 2. Matrix B will not solve

# initial matrix load and solve
a <- makeCacheMatrix(A)
inverseA1 <- cacheSolve(a)
inverseA1
# > a <- makeCacheMatrix(A)
# > inverseA1 <- cacheSolve(a)
# > inverseA1
# [,1]        [,2]    [,3]
# col1  0.08333333 -0.08333333  0.2500
# col2 -0.33333333  0.33333333  0.0000
# col3  0.22916667  0.02083333 -0.0625

# second call to test caching
inverseA2 <- cacheSolve(a)
inverseA2
# > inverseA2 <- cacheSolve(a)
# getting cached data
# > inverseA2
# [,1]        [,2]    [,3]
# col1  0.08333333 -0.08333333  0.2500
# col2 -0.33333333  0.33333333  0.0000
# col3  0.22916667  0.02083333 -0.0625

# initial matrix load and solve
b <- makeCacheMatrix(B)
inverseB1 <- cacheSolve(b)
inverseB1
# > b <- makeCacheMatrix(B)
# > inverseB1 <- cacheSolve(b)
# Determinant of input matrix x returns zero.  Cannot solve for input.  Returning NA.
# > inverseB1
# NULL

# second call to test caching
# i.e., this is redundant, nothing will be cached due to inverse exception
inverseB2 <- cacheSolve(b)
inverseB2
# > inverseB2 <- cacheSolve(b)
# Determinant of input matrix x returns zero.  Cannot solve for input.  Returning NA.
# > inverseB2
# NULL