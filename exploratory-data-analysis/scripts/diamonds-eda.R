library(tidyverse)

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

ggsave("exploratory-data-analysis/figs/diamond_hist.png")

smaller <- diamonds %>% 
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

ggsave("exploratory-data-analysis/figs/diamond_hist_smaller.png")

ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))

ggsave("exploratory-data-analysis/figs/diamond_boxplot.png")
