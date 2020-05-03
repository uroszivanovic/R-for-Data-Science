library(tidyverse)

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

ggsave("data-visualization/figs/class_hwy_boxplot.png")
