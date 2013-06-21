# Asymptote graphics example




## Description

The engine runs the code using the `asy` command line program. The result can be `svg`, `png` or `pdf`. `svg` renders better within html. For LaTeX `pdf`/`png` can be used.

see [Asymptote website](http://asymptote.sourceforge.net/) for installation and documentation.

On OS X, one can simply run:

    brew install asymptote

Please have a look at the online [gallery](http://asymptote.sourceforge.net/gallery/index.html) to see how much can be done with asymptote.

## Example

An example of the asy-engine:



```cpp
real u = 40;
// just a comment
draw( (0,0) .. (u,u) .. (u,0) -- (0,0) );
```


![Asymptote Example](http://animation.r-forge.r-project.org/knitr-ex/figure/093-knitr-asy-asy-simple-ex.svg) 



## 3D example



```cpp
import graph3;
import palette;

size(200,300,keepAspect=false);
//settings.nothin=true;

currentprojection=orthographic(10,10,30);
currentlight=(10,10,5);
triple f(pair t) {return (exp(t.x)*cos(t.y),exp(t.x)*sin(t.y),t.y);}

surface s=surface(f,(-4,-2pi),(0,4pi),8,16,Spline);
s.colors(palette(s.map(zpart),Rainbow()));
draw(s,render(merge=true));
```


![Asymptote 3D Example](http://animation.r-forge.r-project.org/knitr-ex/figure/093-knitr-asy-asy-3d-ex.png) 



## An example with data from R

In this example, I  generate data in R and then use it for plotting in asymptote. In addition I use asymptote to find the intersection between the R path and a line. At that intersection I add a latex label.


```r
x = seq(0, 5, l = 100)
y = sin(x)

# save data to csv file
write.table(data.frame(x, y), file = "asy.csv", col.names = FALSE, row.names = FALSE, 
    sep = ",")
```



```cpp
import graph;
size(200,150,IgnoreAspect);

// import data from csv file
file in=input("asy.csv").line().csv();
real[][] a=in.dimension(0,0);
a=transpose(a);

// generate a path
path rpath = graph(a[0],a[1]);
path lpath = (1,0)--(5,1);

// find intersection
pair pA=intersectionpoint(rpath,lpath);

// draw all
draw(rpath,red);
draw(lpath,dashed + blue);
dot("$\delta$",pA,NE);
xaxis("$x$",BottomTop,LeftTicks);
yaxis("$y$",LeftRight,RightTicks);
```


![Asymptote Example](http://animation.r-forge.r-project.org/knitr-ex/figure/093-knitr-asy-asy-ex.svg) 




