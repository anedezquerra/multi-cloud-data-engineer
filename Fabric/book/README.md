# Microsoft Fabric Master Data Engineer

A comprehensive, hands-on academic guide to Microsoft Fabric data engineering,
by **PhD Aned Esquerra Arguelles**. The book is written in modular LaTeX and is
separate from the existing Fabric syllabus at `..\main.tex`.

## What's Inside

The complete program is organized as 6 Fabric milestones, 24 weekly chapters,
and appendices. This scaffold currently builds Chapter 1:

| Part | Content |
|------|---------|
| **Part I** | Core Data Infrastructure and OneLake |
| **Part II** | Data Warehousing and Analytics |
| **Part III** | Data Engineering and ETL Orchestration |
| **Part IV** | Real-Time Intelligence and Streaming |
| **Part V** | Data Science and Machine Learning |
| **Part VI** | Governance, Security, and Exam Prep |

Every chapter opens with **Learning Objectives** and closes with **Further
Reading**, **Key Takeaways**, and **Exercises**, and uses consistent callout boxes
(notes, tips, pitfalls) plus TikZ diagrams.

## Structure

```text
Fabric\book\
├── main.tex
├── preamble.tex
├── references.bib
├── .latexmkrc
├── README.md
├── frontmatter\
│   ├── cover.tex
│   └── preface.tex
└── chapters\
    └── chapter1-onelake-foundations.tex
```

## Building the Book

### Prerequisites

- A TeX distribution: **MiKTeX** (Windows) or **TeX Live**.
- `latexmk` (bundled with MiKTeX/TeX Live).

### Build

From this `Fabric\book\` directory:

```powershell
latexmk -pdf main.tex
latexmk -c
latexmk -C
```

The output is `main.pdf`. To draft a subset of chapters, uncomment the
`\includeonly{...}` line in `main.tex`.
