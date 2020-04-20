library(tidyverse)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))

ggsave("data-visualization/figs/geom_smooth-basic.png")
