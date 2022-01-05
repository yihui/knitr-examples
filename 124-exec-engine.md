---
title: Test the `exec` engine
--- 

# Simple example


```r
1 + 1
```

```
## [1] 2
```


```python
print(1 + 1)
```

```
## 2
```

`engine.opts` can also be used to pass options:


```python
print(1 + 1)
```

```
## 2
```

# Options

All other options should be provided in the chunk option `engine.opts` (`command` can be optionally in `engine.opts`, too).

They can take character values or functions that returns character values.

## ext


```r
1 + 1
```

```
## [1] 2
```

## file


```r
file2 <- function(code, file) {
    xfun::write_utf8("print('file2 executed')", file)
    file
}
```


```python
print(1 + 1)
```

```
## file2 executed
```

## args


```r
f_arg <- function(code, file) {
    # prepend a command
    xfun::append_utf8("print('# file modified in args')", file, sort = rev)
    file
}
```


```python
print(1 + 1)
```

```
## # file modified in args
## 2
```

It can be combined with args1, e.g prepended line will be ignored


```python
print(1 + 1)
```

```
## 2
```

args2 will be passed after. 

So command passed will be 

```
<command> <args1> <args(code, f)> <args2>
```

## Full path command


```python
print("Full path command works")
```

```
## Full path command works
```

# Don't execute

Will output nothing


```python
print(1 + 1)
```

# Error is caught


```r
print(1 + "")
```

```
## Error in 1 + "" : non-numeric argument to binary operator
## Calls: print
## Execution halted
```
