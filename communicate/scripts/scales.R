library(tidyverse)
library(lubridate)

#1-axis:
presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y")

ggsave("communicate/figs/scales.png")

#2-legend:
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom") +
  guides(colour = guide_legend(nrow = 1, override.aes = list(size = 4)))

ggsave("communicate/figs/scales2.png")

#3-showing exact, not the transformed values:
ggplot(diamonds, aes(carat, price)) +
  geom_bin2d() + 
  scale_x_log10() + 
  scale_y_log10()

ggsave("communicate/figs/scales3.png")

#4-ColorBrewer scales:
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv, shape = drv)) +
  scale_colour_brewer(palette = "Set1")

ggsave("communicate/figs/scales4.png")

#5-scale_colour_manual:
fouryears <- make_date(seq(year(min(presidential$start)),
             year(max(presidential$end)),
             by = 4), 1, 1)

presidential %>%
  mutate(
    id = 33 + row_number(),
    name_id = fct_inorder(str_c(name, " (", id, ")"))
  ) %>%
  ggplot(aes(start, name_id, colour = party)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = name_id)) +
  scale_colour_manual("Party", values = c(Republican = "red", Democratic = "blue")) +
  scale_y_discrete(NULL) +
  scale_x_date(NULL,
               breaks = presidential$start, date_labels = "'%y",
               minor_breaks = fouryears
  ) +
  ggtitle("Terms of US Presdients",
          subtitle = "Roosevelth (34th) to Obama (44th)"
  ) +
  theme(
    panel.grid.minor = element_blank(),
    axis.ticks.y = element_blank()
  )

ggsave("communicate/figs/scales5.png")

