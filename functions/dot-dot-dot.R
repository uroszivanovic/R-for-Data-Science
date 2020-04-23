commas <- function(...) stringr::str_c(..., collapse = ", ")
commas(letters[1:10])

rule <- function(..., pad = "-") {
  title <- paste0(...)
  width <- getOption("width") - nchar(title) - 5
  cat(title, " ", stringr::str_dup(pad, width), "\n", sep = "")
}

rule("Important output")
