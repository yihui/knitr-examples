# Include external images

You can call the function `knitr::include_graphics()` in a code chunk to embed external images. This function works for all types of **knitr** source documents, such as Rnw and Rmd. Below is a simple example:


```r
library(knitr)
include_graphics("figure/003-minimal-fancy-rgl-1.png", dpi = NA)
```

![plot of chunk unnamed-chunk-1](https://db.yihui.org/knitr-examples/figure/003-minimal-fancy-rgl-1.png)

You can pass a character vector of mutiple image paths to `include_graphics()`, and you can also use chunk options related to figures, such as `out.width` and `fig.cap`, etc.
