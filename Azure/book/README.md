# Azure Master Data Engineer

A comprehensive, hands-on academic guide to data engineering on Microsoft Azure,
by **PhD Aned Esquerra Arguelles**. The book is written in modular LaTeX and is
the theory-and-architecture companion to the Azure Data Engineering training
program.

---

## What's Inside

The book is organized as **6 Parts / 6 Milestones** and **24 Chapters / 24
Weeks**, plus appendices. It begins with Azure Data Lake Storage Gen2 and expands
toward Synapse, Data Factory, Databricks, Event Hubs, Cosmos DB, governance,
security, FinOps, and DP-203-style exam readiness.

| Part | Focus |
|------|-------|
| **Part I** | Core Data Infrastructure and Storage: ADLS Gen2, security, file formats, governance. |
| **Part II** | Data Warehousing and Analytics: Synapse SQL, serverless lakehouse, Power BI, performance. |
| **Part III** | Batch Processing and ETL Orchestration: Data Factory, integration runtimes, Databricks, Delta Lake. |
| **Part IV** | Streaming and Real-Time Analytics: Event Hubs, Stream Analytics, real-time Spark, Cosmos DB. |
| **Part V** | Machine Learning and MLOps: Azure ML, feature engineering, pipelines, model monitoring, GenAI data products. |
| **Part VI** | Security, Governance, and Exam Prep: Zero Trust, observability, DP-203 preparation, enterprise capstone. |

Every chapter opens with **Learning Objectives** and closes with **Further
Reading**, **Key Takeaways**, and **Exercises**, and uses consistent pedagogical
callout boxes plus TikZ diagrams.

---

## Structure

```text
Azure/book/
├── main.tex                 # master document — compile THIS, not the chapters
├── preamble.tex             # shared packages, colors, TikZ + callout-box styles
├── references.bib           # bibliography database
├── .latexmkrc               # latexmk build configuration
├── frontmatter/             # cover + preface
└── chapters/                # chapters 1–24 and appendices
```

---

## Building the Book

### Prerequisites

- A TeX distribution: **MiKTeX** on Windows or **TeX Live** on Linux/macOS.
- `latexmk` (bundled with MiKTeX/TeX Live). The build uses `pdflatex` + `bibtex` +
  `makeindex`; all packages are standard CTAN packages.
- Perl available on `PATH` for MiKTeX `latexmk` (for example, Git for Windows'
  `C:\Program Files\Git\usr\bin` or a standalone Perl installation).

### Build

From this `Azure\book\` directory:

```powershell
latexmk -pdf main.tex   # builds main.pdf
latexmk -c              # clean auxiliary files, keep the PDF
latexmk -C              # clean everything including the PDF
```

The output is `main.pdf`. To draft a subset of chapters, uncomment the
`\includeonly{...}` line in `main.tex`.

> **Note:** the bibliography and index require `bibtex`/`makeindex` passes.
> `latexmk` runs them automatically; a single raw `pdflatex` run will show
> unresolved-citation and index warnings until those passes complete.

---

## Relationship to the Training Program

This is a standalone book scaffold under `Azure\book\`. It does **not** replace
or modify the existing Azure syllabus file one level up.
