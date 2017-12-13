sum <- function(x, y) {
    x + y
}

# q2.1
cube <- function(x, n) {
  x^3
}

# q2.2
x <-1:10
if (x > 5) {
  x <-0
}

# q2.3
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

# q2.4
x <- 5
y <- if (x < 3) {
  NA
} else {
  10
}
