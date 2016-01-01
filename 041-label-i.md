# My report


```r
data(mtcars)
```

This example shows how to generate chunk labels dynamically with the brew syntax. It was motivated by the SO question: http://stackoverflow.com/q/12095113/559676



## Generate report for each level of cylinder variable

### 6

```r
hist(mtcars$mpg[mtcars$cyl == 6], main = paste(6, "cylinders"))
```

![plot of chunk mpg-histogram-6](http://db.yihui.name/knitr-examples/figure/041-label-i-mpg-histogram-6-1.png)

```r
hist(mtcars$wt[mtcars$cyl == 6], main = paste(6, "cylinders"))
```

![plot of chunk weight-histogam-6](http://db.yihui.name/knitr-examples/figure/041-label-i-weight-histogam-6-1.png)

### 4

```r
hist(mtcars$mpg[mtcars$cyl == 4], main = paste(4, "cylinders"))
```

![plot of chunk mpg-histogram-4](http://db.yihui.name/knitr-examples/figure/041-label-i-mpg-histogram-4-1.png)

```r
hist(mtcars$wt[mtcars$cyl == 4], main = paste(4, "cylinders"))
```

![plot of chunk weight-histogam-4](http://db.yihui.name/knitr-examples/figure/041-label-i-weight-histogam-4-1.png)

### 8

```r
hist(mtcars$mpg[mtcars$cyl == 8], main = paste(8, "cylinders"))
```

![plot of chunk mpg-histogram-8](http://db.yihui.name/knitr-examples/figure/041-label-i-mpg-histogram-8-1.png)

```r
hist(mtcars$wt[mtcars$cyl == 8], main = paste(8, "cylinders"))
```

![plot of chunk weight-histogam-8](http://db.yihui.name/knitr-examples/figure/041-label-i-weight-histogam-8-1.png)
