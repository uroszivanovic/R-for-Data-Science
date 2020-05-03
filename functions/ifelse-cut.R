#if (temp <= 0) {
#  "freezing"
#} else if (temp <= 10) {
#  "cold"
#} else if (temp <= 20) {
#  "cool"
#} else if (temp <= 30) {
#  "warm"
#} else {
#  "hot"
#}

temp <- seq(-10, 50, by = 5)
cut(temp, c(-Inf, 0, 10, 20, 30, Inf),
    right = TRUE,
    labels = c("freezing", "cold", "cool", "warm", "hot")
)
