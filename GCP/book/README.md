# GCP Master Data Engineer

A comprehensive, hands-on academic guide to data engineering on Google Cloud, by **PhD Aned Esquerra Arguelles**.

## What's Inside

The book follows a 24-week curriculum across six milestones:

| Part | Focus |
|------|-------|
| **I** | Core data infrastructure and storage: Cloud Storage, transfer, identity, transactional sources, and operational stores. |
| **II** | BigQuery data warehousing and analytics. |
| **III** | Batch processing, ETL, orchestration, Dataflow, Dataproc, Composer, and Dataform. |
| **IV** | Pub/Sub, streaming pipelines, real-time analytics, and resilience. |
| **V** | Machine learning, MLOps, Vertex AI, and generative AI for data work. |
| **VI** | Security, governance, Dataplex, FinOps, reliability, and exam preparation. |

## Structure

```text
GCP/book/
├── main.tex
├── preamble.tex
├── references.bib
├── .latexmkrc
├── frontmatter/
│   ├── cover.tex
│   └── preface.tex
└── chapters/
    └── chapter1-cloud-storage-foundations.tex
```

## Building the Book

Prerequisites: MiKTeX or TeX Live with `latexmk`, `pdflatex`, `bibtex`, and `makeindex`.

From this directory:

```powershell
latexmk -pdf main.tex
latexmk -c
latexmk -C
```

The output is `main.pdf`. Compile `main.tex`, not individual chapters.

## Relationship to the GCP Syllabus

This modular LaTeX book is separate from the existing `GCP/main.tex` syllabus. It is intended to grow into the academic companion text for the weekly training program without modifying the syllabus file.
