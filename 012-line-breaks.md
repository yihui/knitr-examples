This demos shows you how to replace `\n` to a real line break in the source.

This is what you normally see in the output:


```r
x = "this is a long long\nstring with several\nlines"
```


Modify the `source` hook:




Now we test the `source` hook:


```r
x = "this is a long long
string with several
lines"
```

