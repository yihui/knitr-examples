**Note**: please ignore this example if the version of your **formatR** package is greater than `1.3.2`, because line breaks will be automatically preserved.

This demos shows you how to replace `\n` to a real line break in the source.

This is what you normally see in the output:


```r
x = "this is a long long
string with several
lines"
```

Modify the `source` hook:



Now we test the `source` hook:


```r
x = "this is a long long
string with several
lines"
```
