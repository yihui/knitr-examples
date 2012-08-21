# Testing text output

See if chunk options like `tidy`, `prompt` and `echo`, etc work as expected.

## A normal chunk


```r
1 + 1
```

```
## [1] 2
```

```r
for (i in 1:10) {
    # nothing
}
# two blank lines below


dnorm(0)
```

```
## [1] 0.3989
```


## Do not evaluate


```r
1 + 1
for (i in 1:10) {
    # nothing
}
# two blank lines below


dnorm(0)
```


## Add prompts


```r
> 1 + 1
```

```
## [1] 2
```

```r
> for (i in 1:10) {
+     # nothing
+ }
> # two blank lines below
> 
> 
> dnorm(0)
```

```
## [1] 0.3989
```


## No evaluate or tidy


```r
> 1 + 1
> for (i in 1:10) {
+     # nothing
+ }
> # two blank lines below
> 
> 
> dnorm(0)
```


## Do not tidy


```r
1+1
```

```
## [1] 2
```

```r
for (i in 1:10) {
# nothing
}
# two blank lines below


dnorm(0)
```

```
## [1] 0.3989
```


## Do not echo


```
## [1] 2
```

```
## [1] 0.3989
```


## Do not comment out results


```r
1 + 1
```

```
[1] 2
```

```r
for (i in 1:10) {
    # nothing
}
# two blank lines below


dnorm(0)
```

```
[1] 0.3989
```


## Do not echo the 2nd expression


```r
1 + 1
```

```
## [1] 2
```

```r
# two blank lines below


dnorm(0)
```

```
## [1] 0.3989
```


## Add prompts but no tidy


```r
> 1+1
```

```
## [1] 2
```

```r
> for (i in 1:10) {
+ # nothing
+ }
> # two blank lines below
> 
> 
> dnorm(0)
```

```
## [1] 0.3989
```


## Change prompts


```r
options(prompt = "R> ", continue = "+  ")
```



```r
R> 1 + 1
```

```
## [1] 2
```

```r
R> for (i in 1:10) {
+      # nothing
+  }
R> # two blank lines below
R> 
R> 
R> dnorm(0)
```

```
## [1] 0.3989
```


## Backslashes


```r
{
    # can you deal with \code{foo} or \n, \a?
    gsub("\\.", "\\\\", "a.b.c")  # \link{bar}
}
```

```
## [1] "a\\b\\c"
```

```r
cat("a\tb\ac")
```

```
## a	bc
```


## Other formatR options


```r
options(keep.blank.line = FALSE)
```



```r
1 + 1
for (i in 1:10) {
    # nothing
}
# two blank lines below
dnorm(0)
```



```r
options(keep.comment = FALSE)
```



```r
1 + 1
for (i in 1:10) {
}
dnorm(0)
```



```r
options(left.brace.newline = TRUE, keep.comment = TRUE)
```



```
## [1] 2
```

```r
for (i in 1:10)
{
    # nothing
}
```

```
## [1] 0.3989
```


See <http://yihui.name/formatR> for details.

## Empty chunks



