# Write the chunk wrapper to the output

All chunk options are stored in `options$params.src`.


```r
library(knitr)
knit_hooks$set(wrapper = function(before, options, envir) {
    if (before) {
        sprintf("    ```{r %s}\n", options$params.src)
    } else "    ```\n"
})
```

Can I write the three backticks in the output?

    ```{r test_label, wrapper=TRUE, eval=FALSE}

```r
1 + 1
plot(1)
```

    ```

By default the chunk wrapper will not show up, e.g.


```r
rnorm(100)
y ~ x
```
