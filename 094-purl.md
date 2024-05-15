# An example for `purl()`

The function `purl()` can be used to extract code chunks from a document.


``` r
1 + 1
```

```
## [1] 2
```

``` r
strsplit("hello world", " ")
```

```
## [[1]]
## [1] "hello" "world"
```

A second chunk.


``` r
if (FALSE) plot(1:10)
```

When we do not evaluate a chunk, the code from `purl()` will be commented out.


``` r
paste(letters, collapse = "|")
if (1 == 1) {
    "Awesome!"
}
```

If one chunk should not be included in the results from `purl()`, just use the chunk option `purl = FALSE`:


``` r
# we do not like significance stars!
options(stringsAsFactors = FALSE, show.signif.stars = FALSE)
```

That is it.
