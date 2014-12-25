# Code Externalization

Write R code in external R scripts, and use `read_chunk()` to read them into the current document.


```r
knitr::read_chunk("113-foo.R")
```

The following two chunks are from the external R script `113-foo.R`:


```r
1 + 1
```

```
## [1] 2
```

```r
x = rnorm(10)
```

```r
mean(x)
```

```
## [1] 0.07463
```

```r
sd(x)
```

```
## [1] 0.9538
```
