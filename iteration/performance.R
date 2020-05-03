library(tidyverse)
library(microbenchmark)

add_to_vector <- function(n) {
  output <- vector("integer", 0)
  for (i in seq_len(n)) {
    output <- c(output, i)
  }
  output
}

add_to_vector_2 <- function(n) {
  output <- vector("integer", n)
  for (i in seq_len(n)) {
    output[[i]] <- i
  }
  output
}

timings <- microbenchmark(add_to_vector(10000), add_to_vector_2(10000), times = 10)
timings
