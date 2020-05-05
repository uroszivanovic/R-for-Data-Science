library(tidyverse)
library(viridis)
library(hexbin)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex() +
  facet_wrap(~cut, ncol = 1) +
  scale_fill_viridis()

ggplot(diamonds, aes(x = cut_number(carat, 5), y = price, colour = cut)) +
  geom_boxplot() + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.25))

ggplot(diamonds, aes(colour = cut_number(carat, 5), y = price, x = cut)) +
  geom_boxplot() + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.25))
