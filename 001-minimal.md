# A minimal R Markdown example

A quote:

> Markdown is not LaTeX.

To compile me, run this in R:

    library(knitr)
    knit('001-minimal.Rmd')

See [output here](https://github.com/yihui/knitr-examples/blob/master/001-minimal.md).

## code chunks

A _paragraph_ here. A code chunk below (remember the three backticks):


```r
1 + 1
```

```
## [1] 2
```

```r
0.4 - 0.7 + 0.3  # what? it is not zero!
```

```
## [1] 5.551e-17
```

## graphics

It is easy.


```r
plot(1:10)
```

![plot of chunk unnamed-chunk-2](http://db.yihui.name/knitr-examples/figure/001-minimal-unnamed-chunk-2-1.png) 

```r
hist(rnorm(1000))
```

![plot of chunk unnamed-chunk-2](http://db.yihui.name/knitr-examples/figure/001-minimal-unnamed-chunk-2-2.png) 

## inline code

Yes I know the value of pi is 3.1416, and 2 times pi is 6.2832.

## math

Sigh. You cannot live without math equations. OK, here we go: $\alpha+\beta=\gamma$. Note this is not supported by native markdown. You probably want to try RStudio, or at least the R package **markdown**, or the function `knitr::knit2html()`.

## nested code chunks

You can write code within other elements, e.g. a list

1. foo is good
    
    ```r
    strsplit("hello indented world", " ")[[1]]
    ```
    
    ```
    ## [1] "hello"    "indented" "world"
    ```
2. bar is better

Or inside blockquotes:

> Here is a quote, followed by a code chunk:
>
> 
> ```r
> x = 1:10
> rev(x^2)
> ```
> 
> ```
> ##  [1] 100  81  64  49  36  25  16   9   4   1
> ```

## conclusion

Nothing fancy. You are ready to go. When you become picky, go to the [knitr website](http://yihui.name/knitr/).

![knitr logo](http://yihui.name/knitr/images/knit-logo.png)
