# Using CoffeeScript with knitr


You need to install `coffee`, the command-line version of [CoffeeScript](http://coffeescript.org/#installation).

CoffeeScript compiles javascript:


```coffee
@square = (x) -> x * x
```

```
// (function() {
// 
//   this.square = function(x) {
//     return x * x;
//   };
// 
// }).call(this);
```


To use CoffeeScript in an HTML document, use `results="asis"`, `echo=FALSE`, and wrap the chunk in `<script>` tags.


```coffee
@square = (x) -> x * x
@cube   = (x) -> square(x) * x
```


```coffee
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
