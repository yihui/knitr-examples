We can exit a document early using the `knit_exit()` function.

Below is a simple chunk, and there is a time-consuming chunk after it.


``` r
library(knitr)
1 + 1
```

```
## [1] 2
```

``` r
knit_exit()
```



