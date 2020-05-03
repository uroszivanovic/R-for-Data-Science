library(tidyverse)

gss_cat %>%
  mutate(partyid =fct_collapse(partyid,
                  other = c("No answer", "Don't know", "Other party"),
                  rep = c("Strong republican", "Not str republican"),
                  ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                  dem = c("Not str democrat", "Strong democrat"))) %>%
  count(year, partyid) %>%
  group_by(year) %>%
  mutate(p = n / sum(n)) %>%
  ggplot(aes(x = year, y = p,
             colour = fct_reorder2(partyid, year, p))) +
  geom_point() + 
  geom_line() +
  labs(colour = "Party ID.")

ggsave("factors/figs/democrat_republican_prop.png")
