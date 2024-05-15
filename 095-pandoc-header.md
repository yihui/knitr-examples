% Simple example
% Stephen Eglen
% 2013-07-10

<!--pandoc
format: html
s:
mathjax:
number-sections:
o: output.html

format: latex
number-sections:
include-in-header: 095-pandoc.sty
-->

This first chunk creates the extra lines for the latex header. We use the
`cat` engine to save the content of the chunk to a file specified in the
`engine.opts` option. This file will be passed to `pandoc` via the
`--include-in-header` (or `-H`) option.




We can then do some simple R math.


``` r
2 + 2
```

```
## [1] 4
```


# About this document

To compile this document in R:

``` r
library(knitr)
knit("095-pandoc-header.Rmd")
pandoc("095-pandoc-header", format = "latex")
# or two commands in one
pandoc(knit("095-pandoc-header.Rmd"), format = "latex")
```
