# A Minimal Example

We examine the relationship between speed and stopping
distance using a linear regression model:
$Y = \beta_0 + \beta_1 x + \epsilon$.


```r
par(mar = c(4, 4, 1, 1), mgp = c(2, 1, 0), cex = 0.8)
plot(cars, pch = 20, col = "darkgray")
fit <- lm(dist ~ speed, data = cars)
abline(fit, lwd = 2)
```

![plot of chunk model](https://db.yihui.org/knitr-examples/figure/049-cars-demo-model-1.png)

The slope of a simple linear regression is 3.9324.
