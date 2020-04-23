X <- matrix(rnorm(15), nrow = 5)
X

apply(X, 1, mean)

X_row_means <- vector("numeric", length = nrow(X))
for (i in seq_len(nrow(X))) {
  X_row_means[[i]] <- mean(X[i, ])
}
X_row_means

apply(X, 2, mean)

X_col_means <- vector("numeric", length = ncol(X))
for (i in seq_len(ncol(X))) {
  X_col_means[[i]] <- mean(X[, i])
}
X_col_means

x1 <- list(
  c(0.27, 0.37, 0.57, 0.91, 0.20),
  c(0.90, 0.94, 0.66, 0.63, 0.06), 
  c(0.21, 0.18, 0.69, 0.38, 0.77)
)

x2 <- list(
  c(0.50, 0.72, 0.99, 0.38, 0.78), 
  c(0.93, 0.21, 0.65, 0.13, 0.27), 
  c(0.39, 0.01, 0.38, 0.87, 0.34)
)

x1 %>% lapply(threshold) %>% str()
x2 %>% lapply(threshold) %>% str()

#Base sapply() is a wrapper around lapply() that automatically simplifies the output, 
#but it might be a problem with sort of output
threshold <- function(x, cutoff = 0.8) x[x > cutoff]
x1 %>% sapply(threshold) %>% str()
x2 %>% sapply(threshold) %>% str()

df <- tibble(
  X1 = c(1, 2, 3),
  X2 = c("A", "B", "C"),
  X3 = c(0, -1, 5),
  X4 = c(TRUE, FALSE, TRUE)
)

vapply(df, is.numeric, logical(1)) #try using "map_lgl(df, is.numeric)", it's less typing!

#exp. used with factors:
tapply(mtcars$mpg, mtcars$cyl, mean)
