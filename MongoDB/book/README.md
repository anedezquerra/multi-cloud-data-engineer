# MongoDB Master Data Engineer and Senior Architect

A modular LaTeX academic book for the MongoDB Data Engineering / Senior Architect training program, by **PhD Aned Esquerra Arguelles**.

## What's Inside

The book is organized as 6 milestones, 24 weeks, and appendices:

| Part | Content |
|------|---------|
| **Part I** | WiredTiger internals, schema patterns, migration, validation. |
| **Part II** | Indexing, query plans, aggregation pipelines, analytical patterns. |
| **Part III** | Replica sets, sharding, distributed transactions, global resilience. |
| **Part IV** | Performance tuning, WiredTiger capacity planning, change streams, observability. |
| **Part V** | Security, Atlas operations, compliance, vector search. |
| **Part VI** | DataOps, Kubernetes, runbooks, disaster recovery, production capstone. |

Every chapter opens with **Learning Objectives** and closes with **Further Reading**, **Key Takeaways**, and **Exercises**, using shared callout boxes and TikZ diagrams.

## Structure

```text
MongoDB\book\
├── main.tex
├── preamble.tex
├── references.bib
├── .latexmkrc
├── frontmatter\
│   ├── cover.tex
│   └── preface.tex
└── chapters\
    └── chapter1-wiredtiger-architecture.tex
```

## Building the Book

From this directory in PowerShell:

```powershell
latexmk -pdf main.tex
latexmk -c
```

The output is `main.pdf`. Compile `main.tex`, not individual chapters.

## Relationship to the MongoDB Syllabus

This book lives under `MongoDB\book\` and does not replace or modify the existing `MongoDB\main.tex` syllabus.
