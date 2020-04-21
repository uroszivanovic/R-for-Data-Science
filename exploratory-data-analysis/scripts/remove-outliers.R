library(tidyverse)

filter(diamonds, x > 0, x < 10) %>%
  ggplot() +
  geom_histogram(mapping = aes(x = x), binwidth = 0.01) +
  scale_x_continuous(breaks = 1:10)

ggsave("exploratory-data-analysis/figs/remove_outlier_x.png")

filter(diamonds, y > 0, y < 10) %>%
  ggplot() +
  geom_histogram(mapping = aes(x = y), binwidth = 0.01) +
  scale_x_continuous(breaks = 1:10)

ggsave("exploratory-data-analysis/figs/remove_outlier_y.png")

filter(diamonds, z > 0, z < 10) %>%
  ggplot() +
  geom_histogram(mapping = aes(x = z), binwidth = 0.01) +
  scale_x_continuous(breaks = 1:10)

ggsave("exploratory-data-analysis/figs/remove_outlier_z.png")
