This demos shows you how to optimize PNG images with `optipng`.


```r
library(knitr)
opts_chunk$set(cache = TRUE)
knit_hooks$set(optipng = hook_optipng)
```

Now we set the chunk option `optipng` to a non-`NULL` value, e.g. `''`, to activate the hook.


```r
library(methods)
library(ggplot2)
set.seed(123)
qplot(rnorm(1000), rnorm(1000))
```

![plot of chunk use-optipng](http://db.yihui.name/knitr-examples/figure/035-optipng-use-optipng-1.png)

Same plot, not optimized:


```r
library(methods)
library(ggplot2)
set.seed(123)
qplot(rnorm(1000), rnorm(1000))
```

![plot of chunk no-optipng](http://db.yihui.name/knitr-examples/figure/035-optipng-no-optipng-1.png)

Same plot, most heavily optimized (pass `-o7` to `optipng`):


```r
library(methods)
library(ggplot2)
set.seed(123)
qplot(rnorm(1000), rnorm(1000))
```

![plot of chunk optipng-o7](http://db.yihui.name/knitr-examples/figure/035-optipng-optipng-o7-1.png)
