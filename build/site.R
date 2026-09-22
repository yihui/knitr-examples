#!/usr/bin/env Rscript

# Build a static website for knitr-examples under _site/.
#
# The site is a single-page browser: a dropdown selects an example; the source
# file(s) are shown on the left and the output file(s) on the right. Each file
# is turned into something viewable in an <iframe> or <embed>:
#
# - *.md outputs  -> rendered to full HTML via litedown::mark()
# - *.html/*.pdf  -> served as-is (iframe / embed)
# - everything else (source files, *.tex, *.txt, ...) -> built to a full HTML
#   page via litedown's `embed` engine, which shows the file verbatim with
#   syntax highlighting
#
# Re-knitting (regenerating figure/, *.md, *.tex, ...) is NOT done here; that is
# done via `make knit` etc. (see the `site` target and .github/workflows).

library(litedown)

# full HTML pages (not fragments) so files render standalone in iframes
options(litedown.html.template = TRUE)

out_dir = "_site"
repo_home = "https://github.com/yihui/knitr-examples/"

unlink(out_dir, recursive = TRUE)
dir.create(out_dir, showWarnings = FALSE)

# all numbered files, e.g. 001-minimal.Rmd -> group "001"
files = list.files(".", pattern = "^[0-9]{3}-")
files = files[file.info(files)$isdir %in% FALSE]
groups = split(files, sub("^([0-9]{3}).*$", "\\1", files))

# source input extensions (everything else in a group is treated as output)
src_ext = c("Rmd", "Rnw", "Rhtml", "Rtex", "Rrst", "Rasciidoc", "Rtextile",
            "Rtyp", "brew", "qmd", "lyx", "rnw", "rmd", "tpl", "R", "bib",
            "pandoc")
ext_of = function(f) tolower(tools::file_ext(f))
is_src = function(f) ext_of(f) %in% tolower(src_ext)

# JSON string escape
js = function(x) {
  x = gsub("\\", "\\\\", x, fixed = TRUE)
  x = gsub('"', '\\"', x, fixed = TRUE)
  x
}

# HTML text escape. Some example files use legacy encodings (GB2312, Big5,
# ...) and contain bytes that are not valid UTF-8; scrub those bytes with
# iconv and use useBytes = TRUE so gsub() never errors with "input string is
# invalid UTF-8" (which depends on the CI locale).
esc = function(x) {
  x = iconv(x, from = "UTF-8", to = "UTF-8", sub = "byte")
  x = gsub("&", "&amp;", x, fixed = TRUE, useBytes = TRUE)
  x = gsub("<", "&lt;", x, fixed = TRUE, useBytes = TRUE)
  gsub(">", "&gt;", x, fixed = TRUE, useBytes = TRUE)
}

# build a full HTML page showing a file verbatim, syntax-highlighted client-side
# by Prism (loaded from a CDN). We do NOT use litedown's embed engine here: it
# re-parses fenced code blocks as Markdown, which recurses infinitely for files
# that themselves contain ``` fences (e.g. *.Rmd).
prism = "https://cdn.jsdelivr.net/npm/prismjs@1.29.0"
embed_view = function(f, html) {
  lang = ext_of(f)
  lang = switch(lang, rmd = , rnw = , rtex = , rhtml = , qmd = "markdown",
                r = "r", tex = , rnw = "latex", py = "python", html = "markup",
                lang)
  page = sprintf('<!DOCTYPE html>
<html><head><meta charset="utf-8">
<title>%s</title>
<link rel="stylesheet" href="%s/themes/prism.min.css">
<style>body{margin:0} pre{margin:0;padding:.6em;white-space:pre-wrap;word-break:break-word}</style>
</head><body>
<pre><code class="language-%s">%s</code></pre>
<script src="%s/components/prism-core.min.js"></script>
<script src="%s/plugins/autoloader/prism-autoloader.min.js"></script>
</body></html>',
    esc(f), prism, lang,
    esc(paste(readLines(f, warn = FALSE, encoding = "UTF-8"), collapse = "\n")),
    prism, prism)
  writeLines(page, file.path(out_dir, html))
}

# turn a file into a viewable artifact in _site/; returns list(view, type) where
# type is "iframe" or "embed", or NULL if the file cannot be shown (e.g. a PDF
# that was never compiled)
build_view = function(f) {
  e = ext_of(f)
  if (e == "pdf") {
    if (!file.exists(f)) return(NULL)
    file.copy(f, file.path(out_dir, f), overwrite = TRUE)
    return(list(view = f, type = "embed"))
  }
  if (e == "html") {
    file.copy(f, file.path(out_dir, f), overwrite = TRUE)
    return(list(view = f, type = "iframe"))
  }
  if (e == "md") {
    html = sub("[.]md$", ".html", f)
    mark(f, output = file.path(out_dir, html))
    return(list(view = html, type = "iframe"))
  }
  # any other text file: embed verbatim with syntax highlighting
  html = paste0(f, ".html")
  embed_view(f, html)
  list(view = html, type = "iframe")
}

# build a JS object entry for one example group
entry = function(num, gfiles) {
  gfiles = sort(gfiles)
  srcs = gfiles[vapply(gfiles, is_src, logical(1))]
  outs = setdiff(gfiles, srcs)

  # list a primary source (Rmd/Rnw/...) first, ahead of e.g. a .bib file, so it
  # is the default shown and provides the title
  main_ext = c("rmd", "rnw", "rhtml", "rtex", "rrst", "rasciidoc", "rtextile",
               "rtyp", "qmd", "brew")
  srcs = c(srcs[ext_of(srcs) %in% main_ext], srcs[!ext_of(srcs) %in% main_ext])

  # dropdown label = primary source filename (keep the extension, so e.g.
  # 001-minimal.Rmd vs 002-minimal.Rnw are distinguishable)
  label = if (length(srcs)) srcs[1] else gfiles[1]

  file_obj = function(f) {
    v = build_view(f)
    if (is.null(v)) return(NULL)
    message(num, ": ", f, " -> ", v$view)
    sprintf('{"file":"%s","view":"%s","type":"%s"}', js(f), js(v$view), v$type)
  }
  src_objs = Filter(Negate(is.null), lapply(srcs, file_obj))
  out_objs = Filter(Negate(is.null), lapply(outs, file_obj))

  sprintf('"%s":{"label":"%s","sources":[%s],"outputs":[%s]}',
          num, js(label),
          paste(src_objs, collapse = ","),
          paste(out_objs, collapse = ","))
}

entries = vapply(names(groups), function(n) entry(n, groups[[n]]), character(1))

# copy the figure/ directory (images referenced by the rendered HTML)
if (dir.exists("figure"))
  file.copy("figure", out_dir, recursive = TRUE)

data_js = sprintf("const DATA = {\n%s\n};\nconst ORDER = [%s];",
                  paste(entries, collapse = ",\n"),
                  paste(sprintf('"%s"', names(groups)), collapse = ","))

index = sprintf('<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>knitr examples</title>
<style>
* { box-sizing: border-box; }
body { margin: 0; font-family: system-ui, sans-serif; display: flex; flex-direction: column; height: 100vh; }
header { padding: .5em 1em; border-bottom: 1px solid #ccc; display: flex; align-items: center; gap: .75em; flex-wrap: wrap; }
header h1 { font-size: 1.1em; margin: 0; white-space: nowrap; }
header a { color: inherit; }
select { font-size: 1em; padding: .2em; max-width: 22em; }
main { flex: 1; display: flex; min-height: 0; }
.pane { flex: 1; display: flex; flex-direction: column; min-width: 0; }
.pane:first-child { border-right: 1px solid #ccc; }
.pane-head { padding: .35em .6em; background: #f5f5f5; border-bottom: 1px solid #ddd; display: flex; align-items: center; gap: .5em; font-size: .85em; }
.pane-head b { white-space: nowrap; }
.pane-body { flex: 1; min-height: 0; }
.pane-body iframe, .pane-body embed { width: 100%%; height: 100%%; border: 0; }
</style>
</head>
<body>
<header>
<h1>knitr examples</h1>
<select id="example" aria-label="example"></select>
<span style="margin-left:auto;font-size:.85em">
<a href="%s">source</a>
</span>
</header>
<main>
<div class="pane">
<div class="pane-head"><b>Source</b><select id="src" aria-label="source file"></select></div>
<div class="pane-body" id="src-body"></div>
</div>
<div class="pane">
<div class="pane-head"><b>Output</b><select id="out" aria-label="output file"></select></div>
<div class="pane-body" id="out-body"></div>
</div>
</main>
<script>
%s

const exampleSel = document.getElementById("example");
const srcSel = document.getElementById("src");
const outSel = document.getElementById("out");
const srcBody = document.getElementById("src-body");
const outBody = document.getElementById("out-body");

ORDER.forEach(k => {
  const o = document.createElement("option");
  o.value = k; o.textContent = DATA[k].label;
  exampleSel.appendChild(o);
});

function frame(item) {
  if (!item) return "<p style=\\"padding:1em;color:#888\\">(none)</p>";
  if (item.type === "embed")
    return `<embed src="${item.view}" type="application/pdf">`;
  return `<iframe src="${item.view}"></iframe>`;
}

function fillSelect(sel, items) {
  sel.innerHTML = "";
  items.forEach((it, i) => {
    const o = document.createElement("option");
    o.value = i; o.textContent = it.file;
    sel.appendChild(o);
  });
  sel.style.display = items.length > 1 ? "" : "none";
}

function loadExample(k) {
  const e = DATA[k];
  fillSelect(srcSel, e.sources);
  fillSelect(outSel, e.outputs);
  srcBody.innerHTML = frame(e.sources[0]);
  outBody.innerHTML = frame(e.outputs[0]);
}

exampleSel.addEventListener("change", () => loadExample(exampleSel.value));
srcSel.addEventListener("change", () =>
  srcBody.innerHTML = frame(DATA[exampleSel.value].sources[srcSel.value]));
outSel.addEventListener("change", () =>
  outBody.innerHTML = frame(DATA[exampleSel.value].outputs[outSel.value]));

loadExample(ORDER[0]);
</script>
</body>
</html>
', repo_home, data_js)

writeLines(index, file.path(out_dir, "index.html"))
message("Wrote ", file.path(out_dir, "index.html"), " with ", length(entries), " examples.")
