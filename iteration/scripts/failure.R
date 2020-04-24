library(tidyverse)

#safely():
safe_log <- safely(log)

str(safe_log(10))
str(safe_log("a"))

x <- list(1, 10, "a")
y <- x %>% map(safely(log))
str(y)

#two lists errors and outputs:
y <- y %>% transpose()
str(y)

#looking at these values:
is_ok <- y$error %>% map_lgl(is_null)
x[!is_ok]
y$result[is_ok] %>% flatten_dbl()

#possibly():
x <- list(1, 10, "a")
x %>% map_dbl(possibly(log, NA_real_))

#quietly() captures printed output, messages, and warnings:
x <- list(1, 10, "a")
x %>% map_dbl(possibly(log, NA_real_))