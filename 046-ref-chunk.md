Code chunks can be referenced via `<<label>>`. First, we define `chunk-a`:


``` r
1 + 1
```

Then use it in `chunk-b` (the reference needs to be on its own line):


``` r
f = function() {
    (1 + 1)^3
}
f()
```

```
## [1] 8
```

If the reference is not found, `<<>>` will not be resolved:


``` r
g = function() {
  # there is no chunk-z
  <<chunk-z>>
}
```

Or you can disable the reference via `ref.chunk = FALSE`:


``` r
# a literal string
h = "
<<chunk-a>>
"
```
