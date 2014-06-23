---
title: "Landscape PDF from rmarkdown"
author: "Yihui Xie"
date: "06/23/2014"
output: pdf_document
classoption: landscape
---

When converting R Markdown to PDF, we can use [a lot of variables](http://johnmacfarlane.net/pandoc/README.html) for the LaTeX template. This short example shows the `classoption` variable that takes the value `landscape` to produce PDF in the landscape orientation.


```r
str(cars)
```

```
## 'data.frame':	50 obs. of  2 variables:
##  $ speed: num  4 4 7 7 8 9 10 10 10 11 ...
##  $ dist : num  2 10 4 22 16 10 18 26 34 17 ...
```

```r
summary(lm(dist ~ speed, cars))
```

```
## 
## Call:
## lm(formula = dist ~ speed, data = cars)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -29.07  -9.53  -2.27   9.21  43.20 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -17.579      6.758   -2.60    0.012 *  
## speed          3.932      0.416    9.46  1.5e-12 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 15.4 on 48 degrees of freedom
## Multiple R-squared:  0.651,	Adjusted R-squared:  0.644 
## F-statistic: 89.6 on 1 and 48 DF,  p-value: 1.49e-12
```

Please read the documentation of Pandoc for other possible variables.
