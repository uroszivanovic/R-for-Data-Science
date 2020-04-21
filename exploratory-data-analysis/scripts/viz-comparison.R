library(tidyverse)

ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggsave("exploratory-data-analysis/figs/diamond_freqpoly.png")

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram() +
  facet_wrap(~cut, ncol = 1, scales = "free_y")

ggsave("exploratory-data-analysis/figs/diamond_hist.png")

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_violin() +
  coord_flip()

ggsave("exploratory-data-analysis/figs/diamond_violin.png")

