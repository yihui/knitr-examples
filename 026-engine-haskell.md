Does Haskell work with **knitr**?

Note we have to specify the compiler manually, e.g. `engine.path='ghc'` (`haskell` itself may not exist as an executable program).


```haskell
[x | x <- [1..10], odd x]
```

```
## [1,3,5,7,9]
```

