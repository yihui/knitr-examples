# Call Rcpp from knitr




When the chunk option `engine='Rcpp'`, the code chunk will be compiled through **Rcpp** via `cppFunction()` or `sourceCpp()` (the latter is called if `[[Rcpp::` was detected in the code chunk).

Test for `fibonacci`:


```cpp
int fibonacci(const int x) {
    if (x == 0 || x == 1) return(x);
    return (fibonacci(x - 1)) + fibonacci(x - 2);
}
```


It can be called as a normal R function now:


```r
fibonacci(10L)
```

```
## [1] 55
```

```r
fibonacci(20L)
```

```
## [1] 6765
```


We can specify additional arguments to be passed to **Rcpp** via the `engine.opts` option, e.g. we use the **RcppArmadillo** package below:


```cpp
List fastLm(NumericVector yr, NumericMatrix Xr) {

    int n = Xr.nrow(), k = Xr.ncol();

    arma::mat X(Xr.begin(), n, k, false); // reuses memory and avoids extra copy
    arma::colvec y(yr.begin(), yr.size(), false);

    arma::colvec coef = arma::solve(X, y); // fit model y ~ X
    arma::colvec resid = y - X*coef; // residuals

    double sig2 = arma::as_scalar( arma::trans(resid)*resid/(n-k) );
                                                // std.error of estimate
    arma::colvec stderrest = arma::sqrt(
                    sig2 * arma::diagvec( arma::inv(arma::trans(X)*X)) );

    return List::create(Named("coefficients") = coef,
                        Named("stderr") = stderrest
    );
}
```


A test:


```r
fastLm(rnorm(10), matrix(1:20, ncol = 2))
```

```
## $coefficients
##          [,1]
## [1,] -0.13452
## [2,]  0.05255
## 
## $stderr
##         [,1]
## [1,] 0.16953
## [2,] 0.06673
## 
```

