# Snowflake Master Data Engineer

A comprehensive, hands-on academic guide to Snowflake architecture, Snowpark,
and DataOps, by **PhD Aned Esquerra Arguelles**. The book is written as modular
LaTeX under `Snowflake\book` so it does not replace the existing Snowflake
syllabus at `Snowflake\main.tex`.

---

## What's Inside

The book maps a 24-week training program to six milestones:

| Part | Milestone |
|------|-----------|
| **I** | Architecture, Warehouses, and Storage Engine |
| **II** | Data Loading and Transformation |
| **III** | Streaming, Streams, and Tasks |
| **IV** | Snowpark and Programmability |
| **V** | Governance, Security, and Data Sharing |
| **VI** | DataOps, Optimization, and Exam Prep |

Every chapter opens with **Learning Objectives** and closes with **Further
Reading**, **Key Takeaways**, and **Exercises**, with academic citations,
callout boxes, SQL/Python listings, and TikZ diagrams.

---

## Structure

```text
Snowflake\book\
├── main.tex                 # master document — compile THIS, not chapters
├── preamble.tex             # shared packages, colors, TikZ + callout styles
├── references.bib           # bibliography database
├── .latexmkrc               # latexmk build configuration
├── frontmatter\             # cover + preface
└── chapters\                # modular chapters
```

---

## Building the Book

### Prerequisites

- A TeX distribution such as **MiKTeX** on Windows.
- `latexmk` (bundled with MiKTeX/TeX Live). The build uses `pdflatex` + `bibtex` +
  `makeindex`; packages are standard CTAN packages.

### Build

From this `Snowflake\book` directory:

```powershell
latexmk -pdf main.tex
latexmk -c        # clean auxiliary files, keep PDF
latexmk -C        # clean all generated files including PDF
```

The output is `main.pdf`. To draft a subset of chapters, uncomment the
`\includeonly{...}` line in `main.tex`.

> **Note:** bibliography and index entries need `bibtex` and `makeindex` passes.
> `latexmk` runs them automatically; raw `pdflatex` alone will leave unresolved
> citations and index warnings until those passes complete.
