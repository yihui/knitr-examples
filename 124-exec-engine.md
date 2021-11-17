---
title: test
output: 
  html_document: default
--- 

# Simple example


```exec
1 + 1
.libPaths()
```

```
## [1] 2
## [1] "C:/Users/chris/Documents/R/win-library/4.1"
## [2] "C:/Program Files/R/R-4.1.1/library"
```


```exec
1 + 1
.libPaths()
```

```
## [1] 2
## [1] "C:/Users/chris/Documents/R/win-library/4.1"
## [2] "C:/Program Files/R/R-4.1.1/library"
```


```exec
print(1 + 1)
```

```
## 2
```


```exec
print(1 + 1)
```

```
## 2
```

# Options

## Ext

It should be a function


```exec
1 + 1
```

```
## [1] 2
```

## file

It should be a function or it is ignored


```r
file2 <- function(code, file) {
    xfun::write_utf8("print('file2 executed')", file)
    file
}
```



```exec
print(1 + 1)
```

```
## file2 executed
```

## args

should be a function to modify the second argument (e.g filename) used 


```r
f_arg <- function(code, file) {
    # prepend a command
    xfun::append_utf8("print('# file modified in args')", file, sort = rev)
    file
}
```


```exec
print(1 + 1)
```

```
## # file modified in args
## 2
```

It can be combined with args1, e.g prepended line will be ignored


```exec
print(1 + 1)
```

```
## 2
```

args2 will be passed after. 

So command passed will be 

```
<command> <args1> <args1(code, f)> <args2>
```

## Full path command


```exec
print("Full path command works")
```

```
## Full path command works
```

# Don't execute

Will output nothing


```exec
print(1 + 1)
```

# Error is catched

FIXME: Does not currently works


```exec
print(1 + "")
```
