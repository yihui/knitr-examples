# Include external images

You can call the function `knitr::include_graphics()` in a code chunk to embed external images. This function works for all types of **knitr** source documents, such as Rnw and Rmd. Below is a simple example:


```r
library(knitr)
include_graphics("figure/003-minimal-html-cars-scatter-2.png", dpi = NA)
```

![plot of chunk unnamed-chunk-1](https://db.yihui.org/knitr-examples/figure/003-minimal-html-cars-scatter-2.png)

You can pass a character vector of mutiple image paths to `include_graphics()`, and you can also use chunk options related to figures, such as `out.width` and `fig.cap`, etc.

# Some tests

Below are some tests for the PR https://github.com/yihui/knitr/pull/1776.

## Three graphics in the same chunk




```r
images = c("figure/001-minimal-unnamed-chunk-2-1.png", "figure/001-minimal-unnamed-chunk-2-2.png",
    "figure/003-minimal-html-cars-scatter-2.png")
```

Using three times `include_graphics()`:


```r
knitr::include_graphics(images[1])
knitr::include_graphics(images[2])
knitr::include_graphics(images[3])
```

<div class="figure">
<img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-1.png" alt="This is a caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-2.png" alt="This is a caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/003-minimal-html-cars-scatter-2.png" alt="This is a caption" width="33%" />
<p class="caption">This is a caption</p>
</div>


```r
knitr::include_graphics(images)
```

<div class="figure">
<img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-1.png" alt="This is another caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-2.png" alt="This is another caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/003-minimal-html-cars-scatter-2.png" alt="This is another caption" width="33%" />
<p class="caption">This is another caption</p>
</div>

## Mixing with R plots


```r
knitr::include_graphics(images[1])
plot(cars)
knitr::include_graphics(images[2])
1 + 1
```

```
## [1] 2
```

```r
knitr::include_graphics(images[3])
```

<div class="figure">
<img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-1.png" alt="This is a caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/099-include-graphics-mix-a-2.png" alt="This is a caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-2.png" alt="This is a caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/003-minimal-html-cars-scatter-2.png" alt="This is a caption" width="33%" />
<p class="caption">This is a caption</p>
</div>


```r
knitr::include_graphics(images[1:2])
```

<div class="figure">
<img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-1.png" alt="This is a caption" width="33%" />
<p class="caption">This is a caption</p>
</div><div class="figure">
<img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-2.png" alt="This is another" width="33%" />
<p class="caption">This is another</p>
</div>

```r
plot(cars)
```

<div class="figure">
<img src="https://db.yihui.org/knitr-examples/figure/099-include-graphics-mix-b-3.png" alt="this is a plot" width="33%" />
<p class="caption">this is a plot</p>
</div>

```r
1 + 1
```

```
## [1] 2
```

```r
knitr::include_graphics(images[3])
```

<div class="figure">
<img src="https://db.yihui.org/knitr-examples/figure/003-minimal-html-cars-scatter-2.png" alt="And a last" width="33%" />
<p class="caption">And a last</p>
</div>

## Placing caption at the top


```r
knitr::include_graphics(images[1])
knitr::include_graphics(images[2])
knitr::include_graphics(images[3])
```

<div class="figure">
<p class="caption">This is a caption</p><img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-1.png" alt="This is a caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-2.png" alt="This is a caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/003-minimal-html-cars-scatter-2.png" alt="This is a caption" width="33%" /></div>


```r
knitr::include_graphics(images)
```

<div class="figure">
<p class="caption">This is another caption</p><img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-1.png" alt="This is another caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/001-minimal-unnamed-chunk-2-2.png" alt="This is another caption" width="33%" /><img src="https://db.yihui.org/knitr-examples/figure/003-minimal-html-cars-scatter-2.png" alt="This is another caption" width="33%" /></div>
