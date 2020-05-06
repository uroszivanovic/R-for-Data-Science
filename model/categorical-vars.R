library(tidyverse)
library(modelr)
options(na.action = na.warn)

ggplot(sim2) + 
  geom_point(aes(x, y))

mod2 <- lm(y ~ x, data = sim2)

grid <- sim2 %>% 
  data_grid(x) %>% 
  add_predictions(mod2)
grid

ggplot(sim2, aes(x)) + 
  geom_point(aes(y = y)) +
  geom_point(data = grid, aes(y = pred), colour = "red", size = 4)
