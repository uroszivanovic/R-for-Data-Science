fuel-economy
================
Uros Zivanovic
April 26, 2020

Fuel economy for compacts
=========================

``` r
ggplot(class, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(se = FALSE)
```

![](fuel-economy_files/figure-markdown_github/unnamed-chunk-1-1.png)
