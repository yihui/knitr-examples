---
title: "Test Fortran"
author: "John Nash"
date: "July 3, 2014"
output: html_document
---

# Run fortran subroutines

Does it work?


```fortran
C Fortran test
      subroutine fexp(n, x)
      double precision x
C  output
      integer n, i
C  input value
      do 10 i=1,n
         x=dexp(dcos(dsin(dble(float(i)))))
  10  continue
      return
      end
```

Now try running it.


```r
res = .Fortran("fexp", n = 100000L, x = 0)
str(res)
## List of 2
##  $ n: int 100000
##  $ x: num 2.72
```
