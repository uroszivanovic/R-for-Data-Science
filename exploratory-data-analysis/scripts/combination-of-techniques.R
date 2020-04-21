library(tidyverse)
library(viridis)
library(hexbin)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex() +
  facet_wrap(~cut, ncol = 1) +
  scale_fill_viridis()

ggsave("exploratory-data-analysis/figs/diamond_viridis.png")

ggplot(diamonds, aes(x = cut_number(carat, 5), y = price, colour = cut)) +
  geom_boxplot() + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.25))

ggsave("exploratory-data-analysis/figs/cut_price_boxplot.png")

ggplot(diamonds, aes(colour = cut_number(carat, 5), y = price, x = cut)) +
  geom_boxplot() + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.25))

ggsave("exploratory-data-analysis/figs/cut_price_boxplot2.png")
