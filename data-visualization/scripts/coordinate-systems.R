library(tidyverse)

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()

ggsave("data-visualization/class~hwy_boxplot.png")
