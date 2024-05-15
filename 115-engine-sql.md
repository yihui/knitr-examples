---
title: "Knit SQL Demo"
---


``` r
library(DBI)
db <- dbConnect(RSQLite::SQLite(), dbname = ":memory:")
```


``` sql
DROP TABLE IF EXISTS packages
```


``` sql
CREATE TABLE packages (id INTEGER, name TEXT)
```


``` sql
INSERT INTO 
  packages 
VALUES 
  (1, 'readr'), 
  (2, 'readxl'), 
  (3, 'haven')
```


``` sql
SELECT * FROM packages
```


<div class="knitsql-table">


Table: 3 records

|id |name   |
|:--|:------|
|1  |readr  |
|2  |readxl |
|3  |haven  |

</div>


``` r
packageReadR <- "readr"
```

Engine can substitute named placeholders in sql that start with `?`. 

Note that if you don't provide `params` as option values will be evaluated from environment


``` sql
SELECT 
  * 
FROM 
  packages
WHERE 
  name = ?packageReadR
```


``` r
readrPackage
```

```
##   id  name
## 1  1 readr
```

To use parameterised queries with native database support provide `params` in the options of the chunk.


``` r
parameters <- list(package = packageReadR)
```


``` sql
SELECT 
  * 
FROM
  packages
WHERE 
  name = @package
```


``` r
readrPackage
```

```
##   id  name
## 1  1 readr
```


``` sql
DROP TABLE IF EXISTS packages
```


``` sql
SELECT * FROM packages
```

```
## Error: no such table: packages
```

