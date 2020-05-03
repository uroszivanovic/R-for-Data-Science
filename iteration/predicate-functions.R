library(tidyverse)

iris %>% 
  keep(is.factor) %>% 
  str()

iris %>% 
  discard(is.factor) %>% 
  str()

x <- list(1:5, letters, list(10))

x %>% 
  some(is_character)

x %>% 
  every(is_vector)

#detect() finds the first element where the predicate is true:
x <- sample(10)
x

x %>% 
  detect(~ . > 5)

#detect_index() returns its position:
x %>% 
  detect_index(~ . > 5)

#others:
x %>% 
  head_while(~ . > 5)

x %>% 
  tail_while(~ . > 5)
