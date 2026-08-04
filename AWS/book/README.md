# AWS Master Data Engineer

A comprehensive, hands-on academic guide to AWS data engineering, by **PhD Aned Esquerra Arguelles**. The book is written in modular LaTeX and is designed as the theory-and-architecture companion to a 24-week AWS Data Engineering training program.

---

## What's Inside

The book is planned as six milestones and 24 weeks:

| Part | Content |
|------|---------|
| **Part I** | Core data infrastructure and storage: S3, IAM/networking, data lakes, Athena. |
| **Part II** | Data warehousing and analytics: Redshift, performance, QuickSight, cost-aware analytics. |
| **Part III** | Batch processing and ETL orchestration: Glue, Spark, EMR, Step Functions, Airflow patterns. |
| **Part IV** | Streaming and real-time analytics: Kinesis, Firehose, MSK, Lambda, real-time architectures. |
| **Part V** | Machine learning and MLOps: SageMaker, feature stores, ML pipelines, monitoring. |
| **Part VI** | Security, governance, and exam prep: Lake Formation, compliance, observability, capstone. |

Every chapter opens with **Learning Objectives** and closes with **Further Reading**, **Key Takeaways**, and **Exercises**, with callout boxes and TikZ diagrams throughout.

---

## Structure

```text
AWS/book/
├── main.tex                 # master document — compile THIS, not the chapters
├── preamble.tex             # shared packages, colors, TikZ + callout-box styles
├── references.bib           # bibliography database
├── .latexmkrc               # latexmk build configuration
├── frontmatter/             # cover + preface
└── chapters/                # Chapter 1 now; remaining chapters are placeholders in main.tex
```

---

## Building the Book

### Prerequisites

- MiKTeX or TeX Live with `latexmk`, `pdflatex`, `bibtex`, and `makeindex`.
- The build uses standard CTAN packages.

### Build

From this `AWS/book/` directory:

```powershell
latexmk -pdf main.tex
latexmk -c        # clean auxiliary files (keeps the PDF)
latexmk -C        # clean everything including the PDF
```

The output is `main.pdf`. To draft a subset of chapters, uncomment the `\includeonly{...}` line in `main.tex`.
