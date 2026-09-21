

An alternative text will always be provided with an image tag in html. 

By default, the caption will be used


``` r
plot(1:10)
```

![A caption](https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-1-1.svg)

You can use an alt text different than a caption using `fig.alt`


``` r
plot(1:10)
```

<div class="figure">
<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-2-1.svg" alt="An alternative text"  />
<p class="caption">A caption</p>
</div>


It will be evaluated after the chunk like `fig.cap`


``` r
n = 15
plot(1:n)
```

<div class="figure">
<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-3-1.svg" alt="A graph with 15 points"  />
<p class="caption">15 points</p>
</div>

And recycled if several graphs


``` r
plot(1:15)
```

<div class="figure">
<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-4-1.svg" alt="An alternative text"  />
<p class="caption">A caption</p>
</div>

``` r
plot(1:10)
```

<div class="figure">
<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-4-2.svg" alt="An alternative text"  />
<p class="caption">A caption</p>
</div>

or you can pass a vector


``` r
plot(1:15)
plot(1:10)
```

<div class="figure">
<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-5-1.svg" alt="Alt1"  /><img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-5-2.svg" alt="Alt2"  />
<p class="caption">Fig1</p>
</div>

A plot object may also carry its own alt text (e.g. via `ggplot2::labs(alt =)`), which is used as the default `fig.alt` when the chunk option is not set (#2001)


``` r
library(ggplot2)
ggplot(mtcars, aes(wt, mpg)) + geom_point() + labs(alt = "A scatterplot of mpg against weight")
```

<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-6-1.svg" alt="A scatterplot of mpg against weight"  />

An explicit `fig.alt` still takes precedence over the plot's own alt text


``` r
ggplot(mtcars, aes(wt, mpg)) + geom_point() + labs(alt = "This is ignored")
```

<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-7-1.svg" alt="An explicit alt text"  />

You can mix the two with `NA` for the plots whose alt text should come from the plot object


``` r
ggplot(mtcars, aes(wt, mpg)) + geom_point() + labs(alt = "The first alt text")
ggplot(mtcars, aes(hp, mpg)) + geom_point() + labs(alt = "This is overridden")
```

<img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-8-1.svg" alt="The first alt text"  /><img src="https://pkg.yihui.org/knitr-examples/figure/120-figure-alt-text-unnamed-chunk-8-2.svg" alt="The second alt text"  />

