```{r header-<% cur.cyl %>, results='asis', echo=FALSE}
cat("###", <% cur.cyl %>)
```

```{r mpg-histogram-<% cur.cyl %>}
hist(mtcars$mpg[mtcars$cyl == <% cur.cyl %>], main = paste(<% cur.cyl %>, "cylinders"))
```

```{r weight-histogam-<% cur.cyl %>}
hist(mtcars$wt[mtcars$cyl == <% cur.cyl %>], main = paste(<% cur.cyl %>, "cylinders"))
```

