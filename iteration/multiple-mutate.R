library(tidyverse)

trans <- list(
  disp = function(x) x * 0.0163871,
  am = function(x) {
    factor(x, labels = c("auto", "manual"))
  }
)

for (var in names(trans)) {
  mtcars[[var]] <- trans[[var]](mtcars[[var]])
}

#This code mutates the disp and am columns:

trans[["disp"]] ## 'disp' is multiplied by 0.0163871
trans[["am"]] ## 'am' is replaced by a factor variable.
