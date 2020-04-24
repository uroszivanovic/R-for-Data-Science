library(tidyverse)

#the basic idea of how walk() works: 
x <- list(1, "a", 3)
x %>% 
  walk(print)

plots <- mtcars %>% 
  split(.$cyl) %>% 
  map(~ggplot(., aes(mpg, wt)) + geom_point())
paths <- stringr::str_c(names(plots), ".pdf")

pwalk(list(paths, plots), ggsave, path = "iteration/figs")


