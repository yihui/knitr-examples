# Call Rcpp from knitr



When the chunk option `engine='Rcpp'` is specified (or you write the chunk header as ```` ```{Rcpp} ````), the code chunk will be compiled through **Rcpp** via `sourceCpp()`:

Test for `fibonacci`:


```cpp
#include <Rcpp.h>

// [[Rcpp::export]]
int fibonacci(const int x) {
    if (x == 0 || x == 1) return(x);
    return (fibonacci(x - 1)) + fibonacci(x - 2);
}
```

Because `fibonacci` was defined with the `Rcpp::export` attribute it can now be called as a normal R function:


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

You can define multiple functions (or helper functions that are not exported) within Rcpp code chunks:


```cpp
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector convolveCpp(NumericVector a, NumericVector b) {

    int na = a.size(), nb = b.size();
    int nab = na + nb - 1;
    NumericVector xab(nab);

    for (int i = 0; i < na; i++)
        for (int j = 0; j < nb; j++)
            xab[i + j] += a[i] * b[j];

    return xab;
}

// [[Rcpp::export]]
List lapplyCpp(List input, Function f) {

    List output(input.size());

    std::transform(input.begin(), input.end(), output.begin(), f);
    output.names() = input.names();

    return output;
}
```

If you want to link to code defined in another package (e.g **RcppArmadillo**) then you need to provide an `Rcpp::depends` attribute. For example:


```cpp
// [[Rcpp::depends(RcppArmadillo)]]

#include <RcppArmadillo.h>

using namespace Rcpp;

// [[Rcpp::export]]
List fastLm(NumericVector yr, NumericMatrix Xr) {

    int n = Xr.nrow(), k = Xr.ncol();

    arma::mat X(Xr.begin(), n, k, false); // reuses memory and avoids extra copy
    arma::colvec y(yr.begin(), yr.size(), false);

    arma::colvec coef = arma::solve(X, y);      // fit model y ~ X
    arma::colvec resid = y - X*coef;            // residuals

    double sig2 = arma::as_scalar( arma::trans(resid)*resid/(n-k) );
                                                // std.error of estimate
    arma::colvec stderrest = arma::sqrt(
                    sig2 * arma::diagvec( arma::inv(arma::trans(X)*X)) );

    return List::create(Named("coefficients") = coef,
                        Named("stderr")       = stderrest
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
```

Finally, you can pass additional arguments to `sourceCpp()` via the chunk option `engine.opts`. For example, we can specify `engine.opts=list(showOutput=TRUE, rebuild=FALSE)` to show the output of `R CMD SHLIB`.
