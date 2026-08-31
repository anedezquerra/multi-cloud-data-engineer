# Multi-Cloud Master Data Engineer

LaTeX source for six self-study **"Master Data Engineer"** programs — one per platform:

| Platform | Syllabus (24-week program) | Book (in progress) |
|----------|---------------------------|--------------------|
| AWS | `AWS\AWS Master Data Engineer 6-Month Syllabus.pdf` | `AWS\book\` |
| Azure | `Azure\Azure Master Data Engineer 6-Month Syllabus.pdf` | `Azure\book\` |
| Microsoft Fabric | `Fabric\Microsoft Fabric Master Data Engineer 6-Month Syllabus.pdf` | `Fabric\book\` |
| GCP | `GCP\GCP Master Data Engineer 6-Month Syllabus.pdf` | `GCP\book\` |
| MongoDB | `MongoDB\MongoDB Master Data Engineer 6-Month Syllabus.pdf` | `MongoDB\book\` |
| Snowflake | `Snowflake\Snowflake Master Data Engineer 6-Month Syllabus.pdf` | `Snowflake\book\` |
| Databricks | `Databricks\Databricks Master Data Engineer 6-Month Syllabus.pdf` | `Databricks\book\` |

Each platform folder contains two deliverables:

1. **Syllabus** — `<Platform>\main.tex`, a single-file 6-month / 24-week training program
   (Milestones → Weeks → daily items → monthly capstones → tracking timetable).
   The compiled PDF is committed alongside the source.
2. **Book** — `<Platform>\book\`, a modular LaTeX book (chapter per syllabus week) that
   expands the syllabus into full theory, diagrams, and exercises. Compile
   `<Platform>\book\main.tex`, not the individual chapters.

## Building

**Syllabi** use `fontspec` + `babelfont` (Noto Sans) and must be compiled with XeLaTeX:

```powershell
cd AWS
xelatex main.tex
xelatex main.tex   # second pass resolves TOC and hyperref links
```

**Books** use `pdflatex` + `bibtex` + `makeindex`. The repo script builds one or all:

```powershell
.\build.ps1 -Target AWS     # single book (AWS, Azure, Fabric, GCP, MongoDB, Snowflake, Databricks)
.\build.ps1                 # all seven books
.\build.ps1 -Clean          # remove auxiliary files afterwards
```

Requires MiKTeX or TeX Live (`pdflatex`, `bibtex`, `makeindex`; `xelatex` and the
Noto Sans font for the syllabi).

## Repository conventions

- See `AGENTS.md` for agent rules and `.github\copilot-instructions.md` for
  document-structure conventions (`\dayitem`, `\project`, `\usecase`, `\capstone`).
- LaTeX build artifacts and compiled book PDFs are git-ignored; the six named
  syllabus PDFs are the tracked deliverables.
- `new 32.txt`, `new 33.txt`, `new 34.txt` are loose curated reference notes,
  pending integration into the books' bibliographies.
