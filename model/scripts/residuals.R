library(tidyverse)

library(modelr)
options(na.action = na.warn)

sim1 <- sim1 %>% 
  add_residuals(sim1_mod)
sim1

ggplot(sim1, aes(resid)) + 
  geom_freqpoly(binwidth = 0.5)

ggsave("model/figs/residuals.png")

ggplot(sim1, aes(x, resid)) + 
  geom_ref_line(h = 0) +
  geom_point() 

ggsave("model/figs/residuals2.png")

