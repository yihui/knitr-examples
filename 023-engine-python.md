R works, of course.


```r
set.seed(123)
rnorm(5)
```

```
## [1] -0.56048 -0.23018  1.55871  0.07051  0.12929
```


Does **knitr** work with Python? Use the chunk option `engine='python'`:


```python
x = 'hello, python world!'
print x
print x.split(' ')
```

```
## hello, python world!
## ['hello,', 'python', 'world!']
```


If all the chunks below are python chunks, we can set the engine globally:




## Chunk Options

You can use some chunk options like `eval`, `echo` and `results`. For example, `eval=FALSE` (do not evaluate code):


```python
x = 'hello, python world!'
print x
print x.split(' ')
```


or `echo=FALSE` (hide source code):


```
## hello, python world!
## ['hello,', 'python', 'world!']
```


or `results='hide'`:


```python
x = 'hello, python world!'
print x
print x.split(' ')
```


or `results='asis'`:


```python
print '**Write** _something_ in `Markdown` from `Python`!'
```


**Write** _something_ in `Markdown` from `Python`!


You can also cache the computation:


```python
import time
# pretend this is a time-consuming task...
time.sleep(10)
print 1+1
```

```
2
```


## Strict Markdown

You can use strict markdown (i.e. indent by 4 spaces) by setting `render_markdown(TRUE)`.


    render_markdown(TRUE)


Now see how the output is changed:


    x = 'hello, python world!'
    print x
    print x.split(' ')

    ## hello, python world!
    ## ['hello,', 'python', 'world!']

