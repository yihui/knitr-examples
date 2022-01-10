---
title: The `exec` engine
---

# How does this engine work ?

The `exec` engine allows to execute an arbitrary command on the code chunk
content, optionally with arguments. If any, they are passed to `engine.opts` and
they could be one of the following:

``` r
engine.opts = list(command, input, ext, clean, args, args1, args2)
```

The execution of the chunk will be equivalent to this command line

    <command> <args1> <args> <args2>

Behavior by default, during evaluation will be:

-   Retrieve the path of the command in `command` option.
-   Write the chunk content into a temporary file `f`
-   Register the `clean` function to execute on exit, basically to remove the
    temp file `f`.
-   Compute the argument of the command line by appending the results of
    `args1()`, with `args()` then `args2()`.

There should be very rare usage of changing the default behavior, but it can be
useful to debug for example or other advanced usage.

You can find some examples below on how to use each option. We are using
`Rscript` an d `python` only in the examples below by convenience but this works
with any executables.

# Simple example

`command` can be the name of a command in PATH.


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

or a full path


```python
print("Full path command works")
```

```
## Full path command works
```

It can also be passed as an option in `engine.opts`.


```python
print(1 + 1)
```

```
## 2
```

It is the only option that can be passed as the top-level chunk option.

# Options

All other options should be provided in the chunk option `engine.opts` in a
list. (As you have seen above, `command` can be optionally in `engine.opts`,
too).

They can take character values or functions that returns character values.

## input

It returns the temporary file path that will be used as the input of the
command.

It is a function of two argument `function(code, file){}` - By default, function
is writing `code` into the temporary file that will be executed by the command.
This can be changed if needed for other side-effects. You would still want to
write the `code` into a file (using `xfun::write_utf8()` or another function)
otherwise the command will be executed with an empty file.


```r
input2 <- function(code, file) {
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

## ext

This will determine the extension to use with the temporary file. By default,
the extension will be the name of the command file. Use this option to change
it.

For example, this will ensure the tempfile has a `.R` extension.


```r
1 + 1
```

```
## [1] 2
```

It can be a function of the executable name (i.e `basename(command)`).




```python
print(1 + 1)
```

```
## 2
```

The extension of the temporary does not really matter most of the time but you
can use this option if the command you use needs it.

## args, args1, args2

    <command> <args1()> <args(code, f)> <args2()>

-   `args1` will be the first argument(s) to be passed after the command line.
-   `args` will the main argument passing the temporary input file path to the
    command.
-   `args2` will be the last argument(s) to be passed, after the file argument.

`args` will be by default the temporary file path. If customized, it can be a
function of 2 arguments `function(code, file)`. In this example, a line is
preprended in the file before being run.


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

It can be combined with args1 to pass an argument before in the command line.
For example, here passing `-x` to `python`, which will ignore the prepended
line:


```python
print(1 + 1)
```

```
## 2
```

With setting `args` to a string, you could easily use the `exec` engine to
execute a string.

We are writing this content to `custom.py`


```python
print("Hello from a python file!")
```

That we can execute using an empty `exec` engine chunk


```
## Hello from a python file!
```



`args2` will be passed after. It could be useful if your code contains
arguments, for example:


```python
import sys
print('And the argument is: '+sys.argv[1])
```

```
## And the argument is: hello
```

## clean

By default, the temporary file will be removed. This option can be set to `NULL`
to keep this file for example to debug.


```python
print('This content can be read if you open the file left')
```

```
## This content can be read if you open the file left
```

A file with extension `.python` should be still here


```r
f1 <- list.files(".", pattern = "python.*\\.python")
file.exists(f1)
```

```
## [1] TRUE
```



# Usual knitr option works

## Don't execute

Will output nothing


```python
print(1 + 1)
```

## Error is caught


```r
print(1 + "")
```

```
## Error in 1 + "" : non-numeric argument to binary operator
## Calls: print
## Execution halted
```
