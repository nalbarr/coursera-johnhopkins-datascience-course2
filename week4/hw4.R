# hw4.R

setwd("C:/workspace-programming-r/week4")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
class(outcome)
colnames(outcome)

head(outcome)

ncol(outcome)

outcome[,11]

hist(outcome[,11])

matrix <- data.matrix(outcome)
class(matrix)

matrix

# coerce to matrix with numerics
hist(matrix[,11])


# states
valid_states <- unique(outcome$State)
valid_states

# outcomes
valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
outcome1 <- c("heart attack")
outcome2 <- c("bad")

subset1 <- valid_outcomes[x == c("heart attack")]
subset1

is_valid_state <- function(state) {
  return TRUE  
}

is_valid_outcome <- function(state) {
  return TRUE  
}

#https://www.coursera.org/learn/r-programming/discussions/znVFbLgpEeWlQwoU9G612w/replies/CEVOfchlEeWmXg4iQyfEyQ

best <- function(state, outcome) {
  ## read outcome data
  
  ## check that state and outcome are valid
  
  ## return hospital name in that state with lowest 30-day death
  ## rate
}

