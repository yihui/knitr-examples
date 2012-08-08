Does Awk work in **knitr**?

We need to pass a `file` option to Awk.


```awk
# how many non-empty lines?
NF {
  i = i + 1
}
END { print i }
```

```
600
```



See https://github.com/yihui/knitr-examples/024-engine-awk.md for the output.

