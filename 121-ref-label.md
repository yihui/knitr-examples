---
title: "Test ref.label and opts.label"
---

## Chunk a


```
#>  [1] 2
```

```
#>  [1] 4
```

## Chunk b


``` r
1:10
```

## Setting `opts_template`


``` r
knitr::opts_template$set(skip = list(eval = FALSE), b = list(results = "markup",
    prompt = TRUE))
```

## `ref.label = 'a'`

Ignore chunk options on chunk `a`:


``` r
1 + 1
```

```
## [1] 2
```

``` r
2 + 2
```

```
## [1] 4
```

## `ref.label = I('a')`

Inherit chunk options from chunk `a`:


```
#>  [1] 2
```

```
#>  [1] 4
```

## `ref.label = 'a'` and `opts.label = TRUE`

Inherit chunk options from chunk `a`:


```
#>  [1] 2
```

```
#>  [1] 4
```

## `ref.label = 'a'` and `opts.label = 'b'`

Inherit chunk options from template `b` and then chunk `b`:


``` r
> 1 + 1
> 2 + 2
```

## `ref.label = c('b', 'a')` and `opts.label = TRUE`

Inherit chunk options from chunk `b` (no output) and `a` (no source), so you see nothing below:



## `ref.label = I(c('b', 'a'))`

Same as the previous section---you see nothing below:



## `ref.label = I(c('b', 'a'))` and `echo = TRUE`

Inherit chunk options from chunk `b` (no output) and `a` (no source), and then override with `echo = TRUE`:


``` r
> 1:10
> 1 + 1
> 2 + 2
```

## `ref.label = c('b', 'a')` and `opts.label = 'a'`

Inherit code from chunk `b` and `a`, and chunk options from chunk `a` (no source):


```
#>   [1]  1  2  3  4  5  6  7  8  9 10
```

```
#>  [1] 2
```

```
#>  [1] 4
```

## `ref.label = c('b', 'a')` and `opts.label = 'skip'`

Inherit code from chunk `b` and `a`, and chunk options from template `skip` (no evaluation):


``` r
1:10
1 + 1
2 + 2
```

## `ref.label = I(c('b', 'a'))` and `opts.label = 'skip'`

Inherit code from chunk `b` and `a`, and chunk options from template `skip` (ignore `I()` in `ref.label` since `opts.label` is not empty):


``` r
1:10
1 + 1
2 + 2
```
