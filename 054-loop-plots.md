We can draw plots in a loop.


```r
for (i in 1:5) {
    cat("\n\nthis is plot ", i, "\n\n")
    plot(1:i)
}
```



this is plot  1 

![](http://animation.r-forge.r-project.org/knitr-ex/figure/054-loop-plots-loop1.png) 

this is plot  2 

![](http://animation.r-forge.r-project.org/knitr-ex/figure/054-loop-plots-loop2.png) 

this is plot  3 

![](http://animation.r-forge.r-project.org/knitr-ex/figure/054-loop-plots-loop3.png) 

this is plot  4 

![](http://animation.r-forge.r-project.org/knitr-ex/figure/054-loop-plots-loop4.png) 

this is plot  5 

![](http://animation.r-forge.r-project.org/knitr-ex/figure/054-loop-plots-loop5.png) 

