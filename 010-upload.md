This is an example of using **knitr** with extended markdown (e.g. [GFM](http://github.github.com/github-flavored-markdown/)) and uploading images to imgur.com automatically. Note you should set the graphical device to create images that can be displayed in the web browser, e.g. `dev = 'png'` (it is the default for markdown output) works but `'pdf'` does not.

First, the input file was named as `knitr-upload.Rmd` ([source](https://github.com/yihui/knitr-examples/blob/master/010-upload.Rmd)), and **knitr** will automatically determine the output filename to be `knitr-upload.md`.

I used the code below to make sure **knitr** will upload images and set some global chunk options.


``` r
library(knitr)
opts_knit$set(upload.fun = imgur_upload, base.url = NULL)  # upload all images to imgur.com
opts_chunk$set(fig.width = 5, fig.height = 5, cache = TRUE)
```

Now we write some code chunks in this markdown file:


``` r
## a simple calculator
1 + 1
```

```
## [1] 2
```

``` r
## boring random numbers
set.seed(123)
rnorm(5)
```

```
## [1] -0.56048 -0.23018  1.55871  0.07051  0.12929
```

We can also produce plots which are uploaded to imgur.com:


``` r
par(mar = c(4, 4, 0.1, 0.1))
plot(mpg ~ hp, data = mtcars, pch = 19)
```

![plot of chunk md-cars](https://i.imgur.com/RwGmRjV.png)

``` r
par(mar = c(3, 2, 0.1, 0.1))
matplot(t(scale(mtcars)), lty = 1, type = "l", xaxt = "n", ylab = "")
axis(1, seq(ncol(mtcars)), colnames(mtcars))
```

![plot of chunk md-cars](https://i.imgur.com/NmU7HPX.png)

So **knitr** is ready with GitHub with a single markdown file.
