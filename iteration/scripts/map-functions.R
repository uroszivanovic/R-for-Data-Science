library(tidyverse)

#The output is always a list:
map(c(TRUE, FALSE, TRUE), ~ !.)
map(c("Hello", "World"), str_to_upper)
map(1:5, ~ rnorm(.))
map(c(-0.5, 0, 1), ~ rnorm(1, mean = .))
map(1:5, runif)

#The others - outputs are always vectors:
df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

map_dbl(df, mean)
map_dbl(df, median)
map_dbl(df, sd)

df %>% map_dbl(mean)
df %>% map_dbl(median)
df %>% map_dbl(sd)

map_int(iris, function(x) length(unique(x)))

map_chr(nycflights13::flights, typeof)

map_lgl(diamonds, is.factor)

#the main difference between general map and other map functions (where outputs are vectors):
map(-2:2, rnorm, n = 5)
map_dbl(-2:2, rnorm, n = 5)

#To return a double vector, we could use map() followed by flatten_dbl():
flatten_dbl(map(-2:2, rnorm, n = 5))
