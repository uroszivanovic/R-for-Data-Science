library(tidyverse)

mu <- list(5, 10, -3)
mu %>% 
  map(rnorm, n = 5) %>% 
  str()

sigma <- list(1, 5, 10)
seq_along(mu) %>% 
  map(~rnorm(5, mu[[.]], sigma[[.]])) %>% 
  str()

#map2() - iterates over two vectors in parallel:
map2(mu, sigma, rnorm, n = 5) %>% str()

###like map(), map2() is just a wrapper around a for loop:
#map2 <- function(x, y, f, ...) {
  #out <- vector("list", length(x))
  #for (i in seq_along(x)) {
    #out[[i]] <- f(x[[i]], y[[i]], ...)
  #}
  #out
#}

#pmap() - iterates over more than two vectors in parallel:
n <- list(1, 3, 5)
args1 <- list(n, mu, sigma)
args1 %>%
  pmap(rnorm) %>% 
  str()
#it is better to name the arguments, so the code can be much clearer:
args2 <- list(mean = mu, sd = sigma, n = n)
args2 %>% 
  pmap(rnorm) %>% 
  str()
#storing args in df (the best solution once the code gets complicated):
params <- tribble(
  ~mean, ~sd, ~n,
  5,     1,  1,
  10,     5,  3,
  -3,    10,  5
)
params %>% 
  pmap(rnorm)
