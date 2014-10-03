We can draw plots in a loop.


```r
for (i in 1:5) {
    cat("\n\nthis is plot ", i, "\n\n")
    plot(1:i)
}
```



this is plot  1 

![](http://db.yihui.name/knitr-examples/figure/054-loop-plots-loop-1.png) 

this is plot  2 

![](http://db.yihui.name/knitr-examples/figure/054-loop-plots-loop-2.png) 

this is plot  3 

![](http://db.yihui.name/knitr-examples/figure/054-loop-plots-loop-3.png) 

this is plot  4 

![](http://db.yihui.name/knitr-examples/figure/054-loop-plots-loop-4.png) 

this is plot  5 

![](http://db.yihui.name/knitr-examples/figure/054-loop-plots-loop-5.png) 
