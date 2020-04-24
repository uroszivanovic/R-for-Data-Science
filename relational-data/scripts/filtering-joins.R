library(tidyverse)
library(nycflights13)

airports %>%
  semi_join(flights, c("faa" = "dest")) %>%
  ggplot(aes(lon, lat, colour = tzone)) +
  borders("state") +
  geom_point() +
  coord_quickmap()theme(legend.position = "none") +
  theme(legend.position = "none")


ggsave("relational-data/figs/quickmap.png")
