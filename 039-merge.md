This demo shows you how to merge the source and output blocks in markdown output. Note **knitr** puts R source and output in separate blocks by default.


```r
a = 1
a
```

```
## [1] 1
```

```r
b = 1:10
write(b, "")
```

```
## 1 2 3 4 5
## 6 7 8 9 10
```


See if the chunk option `collapse` works:


```r
a = 1
a
## [1] 1
b = 1:10
write(b, "")
## 1 2 3 4 5
## 6 7 8 9 10
```


Source and output lived together happily ever in **knitr**.
