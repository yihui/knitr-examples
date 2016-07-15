---
title: "Knit SQL Demo"
---


```r
library(DBI)
db <- dbConnect(RSQLite::SQLite(), dbname = ":memory:")
```


```sql
DROP TABLE IF EXISTS packages
```


```sql
CREATE TABLE packages (id INTEGER, name TEXT)
```


```sql
INSERT INTO packages VALUES (1, 'readr'), (2, 'readxl'), (3, 'haven')
```


```sql
SELECT * FROM packages
```




|id |name   |
|:--|:------|
|1  |readr  |
|2  |readxl |
|3  |haven  |


```r
packageReadR <- "readr"
```


```sql
SELECT * FROM packages
WHERE name = ?packageReadR
```


```r
readrPackage
```

```
##   id  name
## 1  1 readr
```

