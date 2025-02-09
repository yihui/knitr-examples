---
title: "Call RcppOctave from knitr"
output:
  html_document:
    highlight: pygments
---

## Example

Defining a matrix in `octave`/`MATLAB` is really easy


```octave
A = [ 4 5 6; 7 8 9]
B = [ 0 1 2 ; 3 4 5 ; 6 7 8]
E = [ A; 10 11 12]
E(:,:, 2) = B
```

You can later get the values of the variables in `R` using RcppOctave


```r
library(RcppOctave)
# List of user-defined variables and functions
o_ls()
```

```
## [1] "A"     "B"     "C"     "E"     "ffact"
```

```r
# Two ways to access the variables
o_get("A", "B", "E")
```

```
## $A
##      [,1] [,2] [,3]
## [1,]    4    5    6
## [2,]    7    8    9
## 
## $B
##      [,1] [,2] [,3]
## [1,]    0    1    2
## [2,]    3    4    5
## [3,]    6    7    8
## 
## $E
## , , 1
## 
##      [,1] [,2] [,3]
## [1,]    4    5    6
## [2,]    7    8    9
## [3,]   10   11   12
## 
## , , 2
## 
##      [,1] [,2] [,3]
## [1,]    0    1    2
## [2,]    3    4    5
## [3,]    6    7    8
```

```r
.O$A
```

```
##      [,1] [,2] [,3]
## [1,]    4    5    6
## [2,]    7    8    9
```

```r
.O$B
```

```
##      [,1] [,2] [,3]
## [1,]    0    1    2
## [2,]    3    4    5
## [3,]    6    7    8
```

```r
.O$E
```

```
## , , 1
## 
##      [,1] [,2] [,3]
## [1,]    4    5    6
## [2,]    7    8    9
## [3,]   10   11   12
## 
## , , 2
## 
##      [,1] [,2] [,3]
## [1,]    0    1    2
## [2,]    3    4    5
## [3,]    6    7    8
```

# Declaring R variables within octave

You can also retrieve the variables directly to your `R` environment, using the chunk option `engine.opts=list(retrieve.vars=TRUE)`


```octave
A = [ 2 6; 3 9]
A *= 2
B = [ 1 2 3; 4 5 6]
```


```r
A
```

```
##      [,1] [,2]
## [1,]    4   12
## [2,]    6   18
```

```r
B
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
```

```r
t(B)
```

```
##      [,1] [,2]
## [1,]    1    4
## [2,]    2    5
## [3,]    3    6
```

Use this with caution, however, as you may overwrite or even delete R variables.


```r
C <- "This content will be overwritten"
E <- "This variable will no longer exist"
```


```octave
C = 'This is the new content for C'
clear E
```


```r
C
```

```
## [1] "This is the new content for C"
```

```r
E
```

```
## Error in eval(expr, envir, enclos): object 'E' not found
```

# octave functions

You can also define functions in octave that you can use within R


```octave
function f = ffact(n)
  f = prod(1:n)
```


```r
ffact(10)
```

```
## [1] 3628800
```

Notice however, that overwritten standard octave functions will not be accessible from R


```octave
function f = fact(n)
  f = prod(1:n)
```


```r
fact(10)
```

```
## Error in eval(expr, envir, enclos): could not find function "fact"
```

`fact` is a standard function in octave. In this case you need to call the function using `.O`


```r
.O$fact(10)
```

```
## [1] 3628800
```
