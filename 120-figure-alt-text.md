

An alternative text will always be provided with an image tag in html. 

By default, the caption will be used


```r
plot(1:10)
```

![A caption](figure/unnamed-chunk-1-1.png)

You can use an alt text different than a caption using `fig.alt`


```r
plot(1:10)
```

<div class="figure">
<img src="figure/unnamed-chunk-2-1.png" alt="An alternative text"  />
<p class="caption">A caption</p>
</div>


It will be evaluated after the chunk like `fig.cap`


```r
n <- 15
plot(1:n)
```

<div class="figure">
<img src="figure/unnamed-chunk-3-1.png" alt="A graph with 15 points"  />
<p class="caption">15 points</p>
</div>

And recycled if several graphs


```r
plot(1:15)
```

<div class="figure">
<img src="figure/unnamed-chunk-4-1.png" alt="An alternative text"  />
<p class="caption">A caption</p>
</div>

```r
plot(1:10)
```

<div class="figure">
<img src="figure/unnamed-chunk-4-2.png" alt="An alternative text"  />
<p class="caption">A caption</p>
</div>

or you can pass a vector


```r
plot(1:15)
plot(1:10)
```

<div class="figure">
<img src="figure/unnamed-chunk-5-1.png" alt="Alt1"  /><img src="figure/unnamed-chunk-5-2.png" alt="Alt2"  />
<p class="caption">Fig1</p>
</div>

