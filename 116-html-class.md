---
title: "HTML-Class Demo"
author: "Ian Lyttle"
---

Here are some (newer) options you can use with **knitr** (>= v1.15.6), `class.source` and `class.output`. Both are useful only for rendering R Markdown files into HTML. Multiple classes can be set by providing a vector, or a space-delimited string, i.e. `class.source = c("foo", "bar")` or `class.source = "foo bar"`.

One way this can be useful is motivated by the original [Stack Overflow question](http://stackoverflow.com/q/41030477/559676), how can we use **knitr** to help us to emphasize "bad" coding practices?

## Using Bootstrap

Using R Markdown, the default behavior is to include the Bootstrap framework. This can make things very easy for you to signify your code and your output. Bootstrap defines some [CSS classes for backgrounds](http://getbootstrap.com/css/#helper-classes-backgrounds): `"bg-primary"`, `"bg-success"`, `"bg-info"`, `"bg-warning"`, and `"bg-danger"`.

For example, we are warned that the normal subsetting of a data frame can be type-unstable. To show this here,  the chunk options are set: `class.source = 'bg-warning', class.output = 'bg-warning'`.


```{.r .bg-warning}
mtcars[, "mpg"]
```

```{.bg-warning}
##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
## [15] 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
## [29] 15.8 19.7 15.0 21.4
```

To make sure that we return a data frame, we set the argument `drop = FALSE`. Here the chunk options are set: `class.source = 'bg-success', class.output = 'bg-success'`.


```{.r .bg-success}
mtcars[, "mpg", drop = FALSE]
```

```{.bg-success}
##                      mpg
## Mazda RX4           21.0
## Mazda RX4 Wag       21.0
## Datsun 710          22.8
## Hornet 4 Drive      21.4
## Hornet Sportabout   18.7
## Valiant             18.1
## Duster 360          14.3
## Merc 240D           24.4
## Merc 230            22.8
## Merc 280            19.2
## Merc 280C           17.8
## Merc 450SE          16.4
## Merc 450SL          17.3
## Merc 450SLC         15.2
## Cadillac Fleetwood  10.4
## Lincoln Continental 10.4
## Chrysler Imperial   14.7
## Fiat 128            32.4
## Honda Civic         30.4
## Toyota Corolla      33.9
## Toyota Corona       21.5
## Dodge Challenger    15.5
## AMC Javelin         15.2
## Camaro Z28          13.3
## Pontiac Firebird    19.2
## Fiat X1-9           27.3
## Porsche 914-2       26.0
## Lotus Europa        30.4
## Ford Pantera L      15.8
## Ferrari Dino        19.7
## Maserati Bora       15.0
## Volvo 142E          21.4
```

## Using Custom CSS

You may wish to set your own CSS -- **knitr** and **rmarkdown** make this easy for you. If you are using the **rmarkdown** package, you can include your CSS file by setting a parameter in the YAML header ([reference](http://rmarkdown.rstudio.com/html_document_format.html#custom_css)). You can also include a chunk of CSS code, as is done here.

Note that for this example, only `class.source` is set.

<style type="text/css">
.bad-code { background-color: salmon; }
</style>


```{.r .bad-code}
mtcars[, "mpg"]
```

```
##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2
## [15] 10.4 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4
## [29] 15.8 19.7 15.0 21.4
```
