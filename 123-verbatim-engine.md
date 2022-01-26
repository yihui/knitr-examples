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

# Setting a language and another class


```{.python .numberLines}
print(1 + 1)
```


```{.python .numberLines}
print(1 + 1)
```

# Content can be read from a file 



but no language is set by default from the file name


```default
h1 {
  color: red;
}
```


```css
h1 {
  color: red;
}
```

One need to use the embed engine for this

* Either using `file` option


```css
h1 {
  color: red;
}
```

* Or setting file name inside code chunk with quotes


```css
h1 {
  color: red;
}
```

or without quotes


```css
h1 {
  color: red;
}
```


