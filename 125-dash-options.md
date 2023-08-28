---
title: Using dash options in YAML options header
---

In Quarto, it is recommended to use YAML options format with dash in option name instead of dot. In knitr 1.44, any chunk option with dash will be transformed to its dot counterpart. This is because knitr is responsible for engine option parsing in Quarto. 

This document checks that YAML options are parsed correctly and that dash option are correctly converted when provided in YAML. 


```
## $echo
## [1] FALSE
## 
## $out.width
## [1] 850
## 
## $sql.max.print
## [1] 1000
## 
## $fig.cap
## [1] "caption"
## 
## $dpi
## [1] 750
## 
## $dev
## [1] "svg"
```

