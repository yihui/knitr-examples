---
title: "Merging messages"
---

Different messages are placed in separate blocks:


```r
f = function() {
    message("Hello")
    message("World!")
}
f()
```

```
## Hello
```

```
## World!
```

Consecutive identical messages are automatically merged into a single block:


```r
f1 = function() {
    for (i in 1:5) message("Hello")
}
f1()
```

```
## Hello
## Hello
## Hello
## Hello
## Hello
```

```r
f2 = function() {
    for (i in 1:5) warning("Hello")
}
f2()
```

```
## Warning in f2(): Hello

## Warning in f2(): Hello

## Warning in f2(): Hello

## Warning in f2(): Hello

## Warning in f2(): Hello
```

A message in `message(..., appendLF = FALSE)` will be merged with the next adjacent message:


```r
f3 = function() {
    message("Hello ", appendLF = FALSE)
    message("World!")
}
f3()
```

```
## Hello World!
```
