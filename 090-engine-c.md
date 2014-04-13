# Compile C code


```r
# is gcc there?
Sys.which("gcc")
```

```
##            gcc 
## "/usr/bin/gcc"
```

Does `engine = 'c'` work?


```c
void square(double *x) {
  *x = *x * *x;
}
```

Test the `square()` function:


```r
.C("square", 9)
```

```
## [[1]]
## [1] 81
```

```r
.C("square", 123)
```

```
## [[1]]
## [1] 15129
```
