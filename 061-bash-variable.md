# Pass variables to bash scripts

Use `Sys.setenv()`:


```r
Sys.setenv(EXAMPLES = "example/path")
```


Now we write a `bash` code chunk:


```bash
echo $EXAMPLES
```

```
example/path
```


It works.
