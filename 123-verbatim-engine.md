---
title: "Test"
output: html_document
---

# Default to text highlight


```default
No specific highlight
```

# Markdown output


```markdown
No specific highlight
```

# No highlight specifically


```
No specific highlight
```

# Use for verbatim Rmd content


````markdown
We can output arbitrary content verbatim.
  
```{r}
1 + 1
```

The content can contain inline code like
`r pi * 5^2`, too.
````

# Other option to set the language 


```javascript
document.getElementById("demo").innerHTML = "Hello JavaScript!";
```


```javascript
document.getElementById("demo").innerHTML = "Hello JavaScript!";
```


```javascript
document.getElementById("demo").innerHTML = "Hello JavaScript!";
```

# Setting a language and another class


```{.python .numberLines}
print(1 + 1)
```


```{.python .numberLines}
print(1 + 1)
```


```{.python .numberLines}
print(1 + 1)
```


```{.python .numberLines}
print(1 + 1)
```
