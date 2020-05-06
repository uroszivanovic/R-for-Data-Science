library(tidyverse)
library(modelr)
options(na.action = na.warn)

library(nycflights13)
library(lubridate)

flights %>%
  mutate(
    date = make_date(year, month, day),
    wday = wday(date, label = TRUE)
  ) %>%
  ggplot(aes(y = distance, x = wday)) +
  geom_boxplot(outlier.shape = NA) +
  labs(x = "Day of Week", y = "Average Distance")

#pointrange witn mean and sd:
flights %>%
  mutate(
    date = make_date(year, month, day),
    wday = wday(date, label = TRUE)
  ) %>%
  ggplot(aes(y = distance, x = wday)) +
  stat_summary() +
  labs(x = "Day of Week", y = "Average Distance")

#geom_violin:
flights %>%
  mutate(
    date = make_date(year, month, day),
    wday = wday(date, label = TRUE)
  ) %>%
  ggplot(aes(y = distance, x = wday)) +
  geom_violin() +
  labs(x = "Day of Week", y = "Average Distance")
