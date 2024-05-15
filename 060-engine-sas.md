# SAS

As long as SAS is not in your `PATH` variable, you need to specify its full path with the `engine.path` option, e.g.


``` sas
data _null_;
put 'Hello, world!';
run;
```

I do not have SAS installed on my system so I did not really run the code above (`eval=FALSE`).

I'm not familiar with SAS either; please feel free to improve the [`sas` engine](https://github.com/yihui/knitr/blob/master/R/engine.R) in **knitr**.
