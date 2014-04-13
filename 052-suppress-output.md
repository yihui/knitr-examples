# Suppress super long output

First we redefine the output hook:


```r
# the default output hook
hook_output = knit_hooks$get("output")
knit_hooks$set(output = function(x, options) {
    if (!is.null(n <- options$out.lines)) {
        x = unlist(stringr::str_split(x, "\n"))
        if (length(x) > n) {
            # truncate the output
            x = c(head(x, n), "....\n")
        }
        x = paste(x, collapse = "\n")  # paste first n lines together
    }
    hook_output(x, options)
})
```

And we do not want the output to be more than 4 lines, so we set this option globally:


```r
opts_chunk$set(out.lines = 4)
```

Test the new output hook:


```r
1 + 1  # this is short
```

```
## [1] 2
```

The output of this chunk is truncated:


```r
1:100
```

```
##   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
##  [18]  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
##  [35]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51
##  [52]  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
....
```
