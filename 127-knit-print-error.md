---
title: Error traceback with rlang
---

If error happens during `knit_print()`, the traceback shown is a smaller one, starting at knit_print() function internal.


``` r
options(rlang_backtrace_on_error_report = "full")
```


``` r
f <- function() g()
g <- function() h()
h <- function() stop("This is an error from knit_print !")

knit_print.custom <- function(x, ...) {
    f()
}
```


``` r
structure("example", class = "custom")
```

```
## Error in `h()`:
## ! This is an error from knit_print !
## Backtrace:
##     ▆
##  1. ├─base::withVisible(knit_print(x, ...))
##  2. ├─knitr::knit_print(x, ...)
##  3. └─global knit_print.custom(x, ...)
##  4.   └─global f()
##  5.     └─global g()
##  6.       └─global h()
```
