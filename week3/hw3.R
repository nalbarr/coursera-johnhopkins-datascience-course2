# A matrix
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

# determinant of A
detA <- det(A)
detA

# inverse of A
inverseA <- solve(A)
inverseA

# determinant of B
#  det(B) is zero
detB <- det(B)
detB

# inverse of B
inverseB <- solve(B)
inverseB

# test cacheMatrix
# 1. Matrix A will solve
# 2. Matrix B will not solve

helper <- makeCacheMatrix(A)
inverseA <- helper$cacheSolve
inverseA

helper <- makeCacheMatrix(B)
inverseB <- helper$cacheSolve
inverseB
