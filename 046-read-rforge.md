This demo shows you how to reference code in a URL. We use R-Forge as an example, but you can really read code from anywhere.

We cache this chunk so that the next time we compile this document, the code does not need to be read from the web again.

```r
library(knitr)
```

```r
demo.sub = read_rforge("rgl/demo/subdivision.r", project = "rgl")
head(demo.sub)
```

```
## [1] ""                                  
## [2] "# RGL-demo: subdivision surfaces"  
## [3] "# author: Daniel Adler"            
## [4] "# $Id$"                            
## [5] ""                                  
## [6] "rgl.demo.subdivision <- function()"
```

Once we have the source code, we can insert it into **knitr** with `read_chunk()`:


```r
read_chunk(lines = demo.sub, labels = "rgl-sub")
```

That means we assigned the code to a chunk named `rgl-sub`, which appears below:


```r
# RGL-demo: subdivision surfaces author: Daniel Adler $Id$

rgl.demo.subdivision <- function() {
    # setup environment
    clear3d("all")
    view3d()
    bg3d(color = "gray")
    light3d()
    
    # generate basic mesh
    obj <- oh3d()
    
    part <- function(level, tx, ...) {
        shade3d(translate3d(obj, tx, 0, 0), color = "gray30", front = "lines", 
            alpha = 0.5, back = "lines", override = TRUE)
        shade3d(translate3d(subdivision3d(obj, depth = level), tx, 0, 0), override = TRUE, 
            ...)
    }
    
    common <- c(alpha = 0.5)
    
    part(0, -5.5, color = "blue", common)
    part(1, -1.75, color = "yellow", common)
    part(2, 1.75, color = "red", common)
    part(3, 5.5, color = "green", common)
    
}

open3d()
rgl.demo.subdivision()
```

You can actually run the code and capture the rgl plot, but before that we need to load the package and set a rgl hook:


```r
library(rgl)
knit_hooks$set(rgl = hook_rgl)
```

Now you can see the 3D plot:


```r
open3d()
rgl.demo.subdivision()
```

![plot of chunk rgl-sub](http://db.yihui.name/knitr-examples/figure/046-read-rforge-rgl-sub-1.png) 
