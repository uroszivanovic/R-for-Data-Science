library(tidyverse)

#1
best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_point(size = 3, shape = 1, data = best_in_class) +
  ggrepel::geom_label_repel(aes(label = model), data = best_in_class)

ggsave("communicate/figs/annotations.png")

#2
class_avg <- mpg %>%
  group_by(class) %>%
  summarise(
    displ = median(displ),
    hwy = median(hwy)
  )


ggplot(mpg, aes(displ, hwy, colour = class)) +
  ggrepel::geom_label_repel(aes(label = class),
                            data = class_avg,
                            size = 6,
                            label.size = 0,
                            segment.color = NA
  ) +
  geom_point() +
  theme(legend.position = "none")

ggsave("communicate/figs/annotations2.png")

#3
label <- mpg %>%
  summarise(
    displ = max(displ), #use 'Inf' if you want to place text exactly on the borders 
    hwy = max(hwy), #use 'Inf' if you want to place text exactly on the borders
    label = "Increasing engine size is \nrelated to decreasing fuel economy."
  )

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right")

ggsave("communicate/figs/annotations3.png")

#4
label2 <- tibble(
  displ = Inf,
  hwy = Inf,
  class = unique(mpg$class),
  label = str_c("Label for ", class)
)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label),
            data = label2, vjust = "top", hjust = "right",
            size = 3
  ) +
  facet_wrap(~class)

ggsave("communicate/figs/annotations4.png")

