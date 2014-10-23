## title: A test script for the function stitch()
## author: Yihui Xie
set.seed(1121)
(x=rnorm(20))
mean(x);var(x)

## ---- plots, fig.height=5 ----
boxplot(x)
hist(x,main='')
