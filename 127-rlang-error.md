---
title: Error traceback with rlang
---

When `error = TRUE` is used, the traceback is shown in cell output if **rlang** is configured.


``` r
options(rlang_backtrace_on_error_report = "full")
```


``` r
f <- function() g()
g <- function() h()
h <- function() stop("This is an error !")
f()
```

```
## Error in `h()`:
## ! This is an error !
## Backtrace:
##     ▆
##  1. └─global f()
##  2.   └─global g()
##  3.     └─global h()
```
