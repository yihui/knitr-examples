# Wrap long lines
 
Long lines in the output will not be (hard-)wrapped automatically unless you break them manually.


```r
a <- "## \"stx2A; shiga-like toxin II A subunit encoded by bacteriophage BP-933W; K11006 shiga toxin subunit A\" "
a
```

```
## [1] "## \"stx2A; shiga-like toxin II A subunit encoded by bacteriophage BP-933W; K11006 shiga toxin subunit A\" "
```

Perhaps you see it is wrapped in RStudio, but that is because `<pre>` has the CSS attribute `white-space: pre-wrap;`. For LaTeX output, the output is in the `verbatim` environment by default, which will not wrap long lines (everything is shown as is).

You can redefine the output hook function so that you can instruct some chunks to hard-wrap their output lines, e.g.


```r
library(knitr)
hook_output = knit_hooks$get("output")
knit_hooks$set(output = function(x, options) {
    # this hook is used only when the linewidth option is not NULL
   if (!is.null(n <- getOption("width"))) {
        x = knitr:::split_lines(x)
        # any lines wider than n should be wrapped
        if (any(nchar(x) > n)) 
            x = strwrap(x, width = n)
        x = paste(x, collapse = "\n")
    }
    hook_output(x, options)
})
```

Now see the output of `a` (note `linewidth` is not a default **knitr** option):


```r
a
```

```
## [1] "## \"stx2A; shiga-like toxin II A subunit encoded
by bacteriophage BP-933W; K11006 shiga toxin subunit A\" "
```
