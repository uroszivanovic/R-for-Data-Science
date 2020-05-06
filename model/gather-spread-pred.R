library(tidyverse)
library(modelr)
options(na.action = na.warn)

sim1_loess <- loess(y ~ x, data = sim1)
sim1_mod <- lm(y ~ x, data = sim1)
grid <- sim1 %>%
  data_grid(x)

grid %>%
  add_predictions(sim1_mod, var = "pred_lm") %>%
  add_predictions(sim1_loess, var = "pred_loess")

grid %>%
  gather_predictions(sim1_mod, sim1_loess)

grid %>%
  spread_predictions(sim1_mod, sim1_loess)
