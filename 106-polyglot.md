# A Knitr "Polyglot" Example for Markdown

This is a minimal example of using "polyglot"" **knitr** to produce an _HTML_ page from _Markdown_.




## Engine runtime paths

* __R__: `/usr/bin/R`
* __python__: `/usr/bin/python`
* __scala__: `/usr/local/bin/scala`
* __bash__: `/bin/bash`


## Input Data
Pass the string to transform to engine subprocess via environment variable.


```r
Sys.setenv(SOMETHING = "something")
```


## Compute Something in R


```
R> 'something' is now 'mightsone'
```


## Compute Something in Scala

Running small fragments without caching can take some time, as the Scala compiler has to launch and compile the script to JVM bytecode. The `-savecompiled` option (passed via `engine.opts`) will result in Scala caching the compiled script outside of _knitr_.


```
Scala> 'something' is now 'segiohmtn'
```


## Compute Something in Python


```
Python> 'something' is now 'omhniestg'
```


## Compute Something in Bash


```
Bash> 'something' is now 'gmisohnte'
```

