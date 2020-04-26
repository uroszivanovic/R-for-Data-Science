library(modelr)
library(tidyverse)
library(gapminder)

###from list functions:
#1
gapminder %>% 
  group_by(country, continent) %>% 
  nest()

#2
gapminder %>% 
  nest(year:gdpPercap)

###from vectorised functions:
#3
df <- tribble(
  ~x1,
  "a,b,c", 
  "d,e,f,g"
) 

df %>% 
  mutate(x2 = stringr::str_split(x1, ","))

#unnesting:
df %>% 
  mutate(x2 = stringr::str_split(x1, ",")) %>% 
  unnest()

#4
sim <- tribble(
  ~f,      ~params,
  "runif", list(min = -1, max = 1),
  "rnorm", list(sd = 5),
  "rpois", list(lambda = 10)
)

sim %>%
  mutate(sims = invoke_map(f, params, n = 10))

###multivalued summaries:
#5
mtcars %>% 
  group_by(cyl) %>% 
  summarise(q = list(quantile(mpg)))

#capturing the probabilities with quantiles:
probs <- c(0.01, 0.25, 0.5, 0.75, 0.99)
mtcars %>% 
  group_by(cyl) %>% 
  summarise(p = list(probs), q = list(quantile(mpg, probs))) %>% 
  unnest()

###from named list:
#6

x <- list(
  a = 1:5,
  b = 3:4, 
  c = 5:6
) 


df <- enframe(x)
df

df %>% 
  mutate(
    smry = map2_chr(name, value, ~ stringr::str_c(.x, ": ", .y[1]))
  )
