library(modelr)
library(tidyverse)
library(gapminder)

by_country <- gapminder %>% 
  group_by(country, continent) %>% 
  nest()

by_country$data[[1]] #the way how to reach nested data frame

country_model <- function(df) {
  lm(lifeExp ~ year, data = df)
}

models <- map(by_country$data, country_model)

#nested linear models:
by_country <- by_country %>% 
  mutate(model = map(data, country_model))
by_country

#adding residuals:
by_country <- by_country %>% 
  mutate(
    resids = map2(data, model, add_residuals)
  )
by_country

resids <- unnest(by_country, resids)
resids

resids %>% 
  ggplot(aes(year, resid)) +
  geom_line(aes(group = country), alpha = 1 / 3) + 
  geom_smooth(se = FALSE)

resids %>% 
  ggplot(aes(year, resid, group = country)) +
  geom_line(alpha = 1 / 3) + 
  facet_wrap(~continent)

#model quality:
glance <- by_country %>% 
  mutate(glance = map(model, broom::glance)) %>% 
  unnest(glance, .drop = TRUE)

#The worst models all appear to be in Africa:
glance %>% 
  ggplot(aes(continent, r.squared)) + 
  geom_jitter(width = 0.5)

bad_fit <- filter(glance, r.squared < 0.25)

gapminder %>% 
  semi_join(bad_fit, by = "country") %>% 
  ggplot(aes(year, lifeExp, colour = country)) +
  geom_line()
