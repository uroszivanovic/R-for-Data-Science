library(tidyverse)

files <- dir("data/", pattern = "\\.csv$", full.names = TRUE)

df_list <- vector("list", length(files))
names(df_list) <- files
for (fname in files) {
  df_list[[fname]] <- read_csv(fname)
}

df <- bind_rows(df_list)
