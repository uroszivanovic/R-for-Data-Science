library(tidyverse)

ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class)) +
  geom_jitter()

ggsave("data-visualization/figs/geom_jitter.png")

ggplot(data = mpg, mapping = aes(x = cty, y = hwy, color = class)) +
  geom_count()

ggsave("data-visualization/figs/geom_count.png")
