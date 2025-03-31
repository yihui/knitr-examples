---
title: Error traceback with rlang
---

Using tools that error with **rlang** should show backtrace in cell output when configured


``` r
options(rlang_backtrace_on_error_report = "full")
```


``` r
f <- function() g()
g <- function() h()
h <- function() rlang::abort("This is an error !")
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
##  4.       └─rlang::abort("This is an error !")
```
