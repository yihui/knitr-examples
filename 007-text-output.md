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
    # nothing before 10
    if (i >= 10) 
        print(i)
}
```

```
## [1] 10
```

```r
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
    # nothing before 10
    if (i >= 10) 
        print(i)
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
+     # nothing before 10
+     if (i >= 10) 
+         print(i)
+ }
```

```
## [1] 10
```

```r
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
1+1
for (i in 1:10) {
# nothing before 10
if(i>=10)print(i)
}
# two blank lines below


dnorm(0)
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
# nothing before 10
if(i>=10)print(i)
}
```

```
## [1] 10
```

```r
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
## [1] 10
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
    # nothing before 10
    if (i >= 10) 
        print(i)
}
```

```
[1] 10
```

```r
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

```
## [1] 10
```

```r
# two blank lines below


dnorm(0)
```

```
## [1] 0.3989
```

## Do not evaluate, echo the 2nd expression


```r
for (i in 1:10) {
    # nothing before 10
    if (i >= 10) 
        print(i)
}
```

## Only evaluate the first two expressions


```r
1 + 1
```

```
## [1] 2
```

```r
for (i in 1:10) {
    # nothing before 10
    if (i >= 10) 
        print(i)
}
```

```
## [1] 10
```

```r
## # two blank lines below
## 
## 
## dnorm(0)
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
+ # nothing before 10
+ if(i>=10)print(i)
+ }
```

```
## [1] 10
```

```r
> # two blank lines below
> 
> 
> dnorm(0)
```

```
## [1] 0.3989
```

## Prompts, no evaluate or tidy


```r
> 1+1
> for (i in 1:10) {
+ # nothing before 10
+ if(i>=10)print(i)
+ }
> # two blank lines below
> 
> 
> dnorm(0)
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
+      # nothing before 10
+      if (i >= 10) 
+          print(i)
+  }
```

```
## [1] 10
```

```r
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
cat("a\tb\nc")
```

```
## a	b
## c
```

## Other formatR options

We can set **formatR** options globally:


```r
options(formatR.blank = FALSE)
```


```r
1 + 1
for (i in 1:10) {
    # nothing before 10
    if (i >= 10) 
        print(i)
}
# two blank lines below
dnorm(0)
```

Or locally in one chunk via `tidy.opts`. Do not keep comments:


```r
1 + 1
for (i in 1:10) {
    if (i >= 10) 
        print(i)
}
dnorm(0)
```

Move left braces to the next line:


```r
for (i in 1:10)
{
    # nothing before 10
    if (i >= 10) 
        print(i)
}
```

```
## [1] 10
```

Indent by 2 spaces:


```r
1 + 1
for (i in 1:10) {
  # nothing before 10
  if (i >= 10) 
    print(i)
}
# two blank lines below
dnorm(0)
```

See <http://yihui.name/formatR> for details.

## Empty chunks



## Messages

Do not include messages:


```r
1 + 1
```

```
## [1] 2
```

```r
message("helloooo!")
```

No warnings:


```r
1:2 + 1:3
```

```
## [1] 2 4 4
```

```r
warning("no no no")
```

Select warnings using numeric indices:


```r
1:2 + 1:3
```

```
## [1] 2 4 4
```

```r
warning("no no no")
```

```
## Warning: no no no
```

Invalid indices will select nothing:


```r
1:2 + 1:3
```

```
## [1] 2 4 4
```

```r
warning("no no no")
```

## The results option

Do not show text results:


```r
1 + 1
for (i in 1:10) {
    # nothing before 10
    if (i >= 10) 
        print(i)
}
# two blank lines below
dnorm(0)
```

Flush all results to the end of a chunk:


```r
1 + 1
for (i in 1:10) {
    # nothing before 10
    if (i >= 10) 
        print(i)
}
# two blank lines below
dnorm(0)
```

```
## [1] 2
## [1] 10
## [1] 0.3989
```

Output as is:


```r
cat("_Markdown_,", "oh yeah, **Markdown**")
```

_Markdown_, oh yeah, **Markdown**
