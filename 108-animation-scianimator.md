# Embed animations using SciAnimator in knitr

We can set the package option `animation.fun` to `hook_scianimator` so that
multiple plots in a chunk can be animated via the SciAnimator library.


``` r
library(knitr)
opts_knit$set(animation.fun = hook_scianimator)
```

You have to embed the jQuery and SciAnimator libraries in the HTML header
(between `<head>` and `</head>`), even though some browsers can tolerate it
if you insert a style sheet after `<body>`.

<link rel="stylesheet" href="http://vis.supstat.com//assets/themes/dinky/css/scianimator.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://vis.supstat.com/assets/themes/dinky/js/jquery.scianimator.min.js"></script>

Here comes a test of the Brownian motion:


``` r
n = length(palette())
x = rnorm(n)
y = rnorm(n)
for (i in 1:20) {
    x = x + rnorm(n)
    y = y + rnorm(n)
    plot(x, y, xlim = c(-10, 10), ylim = c(-10, 10), pch = 19, col = 1:n, cex = 2)
}
```


<div class="scianimator">
<div id="test" style="display: inline-block;">
</div>
</div>
<script type="text/javascript">
  (function($) {
    $(document).ready(function() {
      var imgs = Array(20);
      for (i = 0; ; i++) {
        if (i == imgs.length) break;
        imgs[i] = "https://db.yihui.org/knitr-examples/figure/108-animation-scianimator-test-" + (i + 1) + ".png";
      }
      $("#test").scianimator({
          "images": imgs,
          "delay": 100,
          "controls": ["first", "previous", "play", "next", "last", "loop", "speed"],
      });
      $("#test").scianimator("play");
    });
  })(jQuery);
</script>

There are many other examples at <http://vis.supstat.com>.
