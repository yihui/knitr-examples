# Using CoffeeScript with knitr

First we set a flag `-p` for the `coffee` engine to print the JavaScript output instead of evaluating the code (`engine.opts = '-p'`):



You need to install `coffee`, the command-line version of [CoffeeScript](http://coffeescript.org/#installation).

CoffeeScript compiles javascript:


``` coffee
@square = (x) -> x * x
```

```
// (function() {
//   this.square = function(x) {
//     return x * x;
//   };
// 
// }).call(this);
```

To use CoffeeScript in an HTML document, use `results="asis"`, `echo=FALSE`, and wrap the chunk in `<script>` tags.


``` coffee
@square = (x) -> x * x
@cube   = (x) -> square(x) * x
```

``` coffee
p = document.createElement("p");
p.appendChild(document.createTextNode("The cube of 3 is " + cube(3)))
document.body.appendChild(p)
```

<script type="text/javascript">
(function() {
  this.square = function(x) {
    return x * x;
  };

  this.cube = function(x) {
    return square(x) * x;
  };

}).call(this);

(function() {
  var p;

  p = document.createElement("p");

  p.appendChild(document.createTextNode("The cube of 3 is " + cube(3)));

  document.body.appendChild(p);

}).call(this);
</script>

Of course you can also run the code, if you remove the `-p` flag from the chunk option `engine.opts` (I'm not evaluating this code chunk here because I do not have a proper version of `coffee` on Debian yet; if you do, you can remove `eval=FALSE`):


``` coffee
x = 42
console.log "The answer is ", x
```
