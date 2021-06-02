# Three arguments in chunk hooks

A chunk hook has three arguments: `before`, `options` and `envir`. We show how they work through some simple examples.

## The `before` argument

It is a logical argument: `before == TRUE` executes code before a chunk.


```r
library(knitr)
knit_hooks$set(foo1 = function(before, options, envir) {
    if (before) {
        "_I appear before a chunk!_\n\n"
    } else {
        "\n\n_I am after a chunk..._"
    }
})
```

Test the `foo1` hook:

_I appear before a chunk!_

```r
1 + 1
```

```
## [1] 2
```



_I am after a chunk..._

## The `options` argument

It contains all the chunk options (include global options) for the current chunk.


```r
knit_hooks$set(foo2 = function(before, options, envir) {
    if (!before) {
        z = capture.output(str(options[c("eval", "dev", "results", "bar1", "bar2",
            "bar3")]))
        z = paste("    ", z, sep = "", collapse = "\n")
        paste("Some chunk options in the above chunk are:\n\n", z, sep = "")
    }
})
```

Test the `foo2` hook:


```r
1 + 1
```

```
## [1] 2
```

Some chunk options in the above chunk are:

    List of 6
     $ eval   : logi TRUE
     $ dev    : chr "png"
     $ results: chr "markup"
     $ bar1   : logi TRUE
     $ bar2   : chr "asdf"
     $ bar3   : num 3.14

## The `envir` argument

It is the environment of the current chunk.


```r
knit_hooks$set(foo3 = function(before, options, envir) {
    if (!before) {
        paste("Objects available in the above chunk:", paste("`", ls(envir),
            "`", sep = "", collapse = ", "))
    }
})
```

Test the `foo3` hook:


```r
x2 = 1 + 1
y3 = rnorm(10)
```

Objects available in the above chunk: `x2`, `y3`

Another example:


```r
knit_hooks$set(foo4 = function(before, options, envir) {
    if (!before && exists("z5", envir = envir)) {
        sprintf("**Ha! I see z5 = %.3f!**", envir$z5)
    }
})
```

Test `foo4`:


```r
pi
```

```
## [1] 3.142
```

This above chunk is quiet because `z5` does not exist yet.


```r
z5 = 2 * pi
```

**Ha! I see z5 = 6.283!**
