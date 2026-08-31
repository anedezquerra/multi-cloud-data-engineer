# Databricks Master Data Engineer

A comprehensive, hands-on academic guide to Databricks data engineering, by **PhD Aned Esquerra Arguelles**. The book is written in modular LaTeX and is designed as the theory-and-architecture companion to a 24-week Databricks Data Engineering training program.

---

## What's Inside

The book is organized as six milestones and 24 weeks:

| Part | Content |
|------|---------|
| **Part I** | Lakehouse foundations: Databricks platform and workspace, Delta Lake, the medallion architecture, Apache Spark on Databricks. |
| **Part II** | Warehousing and analytics: Delta optimization, SQL warehouses, AI/BI dashboards and Genie, Unity Catalog governance. |
| **Part III** | Batch ETL and orchestration: PySpark tuning, Delta Live Tables, Auto Loader and CDC, Workflows. |
| **Part IV** | Streaming and real-time: Structured Streaming, state and watermarks, Kafka/Event Hubs/Kinesis, real-time lakehouse architectures. |
| **Part V** | Machine learning and MLOps: MLflow, Feature Store, Mosaic AI and Vector Search, model serving and monitoring. |
| **Part VI** | Security, production, and exam prep: IAM/SCIM/networking, lineage and Delta Sharing, Asset Bundles and Terraform, capstone and certification. |

Every chapter opens with **Learning Objectives** and a **Cross-Cloud Equivalence** box, and closes with **Further Reading**, **Key Takeaways**, and **Exercises**, with callout boxes and TikZ diagrams throughout.

---

## Structure

```text
Databricks/book/
├── main.tex                 # master document — compile THIS, not the chapters
├── preamble.tex             # shared packages, colors, TikZ + callout-box styles
├── references.bib           # bibliography database
├── .latexmkrc               # latexmk build configuration
├── frontmatter/             # cover + preface
├── backmatter/              # glossary
└── chapters/                # chapters 0–24 plus four appendices
```

---

## Building the Book

### Prerequisites

- MiKTeX or TeX Live with `latexmk`, `pdflatex`, `bibtex`, and `makeindex`.
- The build uses standard CTAN packages.

### Build

From this `Databricks/book/` directory:

```powershell
latexmk -pdf main.tex
latexmk -c        # clean auxiliary files (keeps the PDF)
latexmk -C        # clean everything including the PDF
```

Or from the repository root (the repo-wide build script supports this target):

```powershell
powershell -File build.ps1 -Target Databricks
```

The output is `main.pdf`. To draft a subset of chapters, uncomment the `\includeonly{...}` line in `main.tex`.
