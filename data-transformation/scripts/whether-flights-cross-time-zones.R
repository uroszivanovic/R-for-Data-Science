library("nycflights13")
library("tidyverse")

time2mins <- function(x) {
  (x %/% 100 * 60 + x %% 100) %% 1440}


flights_airtime <-
  mutate(flights,
         dep_time = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
         arr_time = (arr_time %/% 100 * 60 + arr_time %% 100) %% 1440,
         air_time_diff = air_time - arr_time + dep_time)

nrow(filter(flights_airtime, air_time_diff != 0))

ggplot(flights_airtime, aes(x = air_time_diff)) +
  geom_histogram(binwidth = 1)

