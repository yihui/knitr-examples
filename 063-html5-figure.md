# Use the `figure` tag for Markdown

By defautl `![...](...)` is translated to `<img src='...' alt='...'>` in Markdown. This demo shows how to use the HTML5 `<figure>` tag:


```r
knit_hooks$set(plot = function(x, options) {
    paste("<figure><img src=\"", opts_knit$get("base.url"), paste(x, collapse = "."), 
        "\"><figcaption>", options$fig.cap, "</figcaption></figure>", sep = "")
})
```

Test:


```r
plot(rnorm(100))
```

<figure><img src="http://animation.r-forge.r-project.org/knitr-ex/figure/063-html5-figure-test-plot.png"><figcaption>Some random numbers.</figcaption></figure>

This is a very simple-minded `plot` hook; you should take a look at [knitr's default definition](https://github.com/yihui/knitr/blob/master/R/hooks-md.R) if you want to improve this hook function.
