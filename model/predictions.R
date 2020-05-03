library(tidyverse)

library(modelr)
options(na.action = na.warn)

sim1_mod <- lm(y ~ x, data = sim1)

grid <- sim1 %>% 
  data_grid(x) 
grid

grid <- grid %>% 
  add_predictions(sim1_mod) 
grid

ggplot(sim1, aes(x)) +
  geom_point(aes(y = y)) +
  geom_line(aes(y = pred), data = grid, colour = "red", size = 1)

ggsave("model/figs/predictions.png")
