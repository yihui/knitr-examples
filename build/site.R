#!/usr/bin/env Rscript

# Build a static website for knitr-examples under _site/.
#
# - Renders every numbered *.md output to standalone *.html via litedown::mark()
# - Copies existing *.html outputs, compiled *.pdf, and the figure/ directory
# - Generates index.html: a listing of all examples grouped by number, with
#   links to the source file (on GitHub) and the rendered output(s)
#
# Re-knitting (regenerating figure/, *.md, *.tex, ...) is NOT done here; that is
# done separately via ./knitall (see .github/workflows/site.yaml). This script
# only turns the knitted outputs into a browsable site.

out_dir = "_site"
repo_url = "https://github.com/yihui/knitr-examples/blob/master"

unlink(out_dir, recursive = TRUE)
dir.create(out_dir, showWarnings = FALSE)

# all numbered files, e.g. 001-minimal.Rmd -> group "001"
files = list.files(".", pattern = "^[0-9]{3}-")
files = files[file.info(files)$isdir %in% FALSE]
groups = split(files, sub("^([0-9]{3}).*$", "\\1", files))

# source input extensions (as opposed to knitted outputs)
src_ext = c("Rmd", "Rnw", "Rhtml", "Rtex", "Rrst", "Rasciidoc", "Rtextile",
            "Rtyp", "brew", "qmd", "lyx", "rnw", "rmd", "tpl", "R")
is_src = function(f) tolower(tools::file_ext(f)) %in% tolower(src_ext)

ext_of = function(f) tolower(tools::file_ext(f))

# render a knitted .md to a standalone .html in _site/
render_md = function(md) {
  html = sub("[.]md$", ".html", md)
  message("mark: ", md, " -> ", html)
  litedown::mark(md, output = file.path(out_dir, html))
  html
}

# escape for HTML text
esc = function(x) {
  x = gsub("&", "&amp;", x, fixed = TRUE)
  x = gsub("<", "&lt;", x, fixed = TRUE)
  gsub(">", "&gt;", x, fixed = TRUE)
}

# build one listing entry (a <section>) for a group, return HTML string
entry = function(num, gfiles) {
  gfiles = sort(gfiles)
  srcs = gfiles[vapply(gfiles, is_src, logical(1))]
  outs = gfiles[!gfiles %in% srcs]

  # a human title from the first source file's stem
  stem = sub("[.][^.]*$", "", if (length(srcs)) srcs[1] else gfiles[1])
  title = gsub("-", " ", sub("^[0-9]{3}-", "", stem))

  # source links point to GitHub (raw source stays in the repo)
  src_links = vapply(srcs, function(f)
    sprintf('<a href="%s/%s"><code>%s</code></a>', repo_url, f, esc(f)),
    character(1))

  # output links: .md -> rendered .html; .html/.pdf served locally; rest -> GitHub
  out_links = character(0)
  for (f in outs) {
    e = ext_of(f)
    if (e == "md") {
      html = render_md(f)
      out_links = c(out_links, sprintf('<a href="%s">%s</a>', html, esc(html)))
    } else if (e %in% c("html", "pdf")) {
      file.copy(f, file.path(out_dir, f), overwrite = TRUE)
      out_links = c(out_links, sprintf('<a href="%s">%s</a>', f, esc(f)))
    } else {
      out_links = c(out_links, sprintf('<a href="%s/%s"><code>%s</code></a>',
                                       repo_url, f, esc(f)))
    }
  }

  sprintf(
    '<section id="%s">\n<h3>%s. %s</h3>\n<p><b>Source:</b> %s</p>\n<p><b>Output:</b> %s</p>\n</section>',
    num, num, esc(title),
    if (length(src_links)) paste(src_links, collapse = " ") else "&mdash;",
    if (length(out_links)) paste(out_links, collapse = " ") else "&mdash;"
  )
}

sections = vapply(names(groups), function(n) entry(n, groups[[n]]), character(1))

# copy the figure/ directory (images referenced by the rendered HTML)
if (dir.exists("figure"))
  file.copy("figure", out_dir, recursive = TRUE)

# assemble index.html
body = paste(sections, collapse = "\n")
index = sprintf('<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>knitr examples</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@xiee/utils/css/default.min.css">
<style>section { margin-bottom: .5em; } h3 { margin-bottom: .2em; }</style>
</head>
<body>
<h1>knitr examples</h1>
<p>A collection of <a href="https://yihui.org/knitr/">knitr</a> examples. Source
files live in the <a href="%s">GitHub repository</a>; below are the rendered
outputs. See <a href="%s/readme.md">readme</a> for details.</p>
%s
</body>
</html>
', repo_url, repo_url, body)

writeLines(index, file.path(out_dir, "index.html"))
message("Wrote ", file.path(out_dir, "index.html"), " with ", length(sections), " examples.")
