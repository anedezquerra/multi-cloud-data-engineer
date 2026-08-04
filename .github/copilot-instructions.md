# Copilot Instructions

This repository holds **LaTeX source for six self-study "Master Data Engineer" syllabi** — one per platform: `AWS/`, `Azure/`, `Fabric/`, `GCP/`, `MongoDB/`, `Snowflake/`. Each is a standalone 6-month / 24-week training program. There is no application code, build system, or test suite; the deliverable of each folder is a compiled PDF syllabus.

## Repository layout

Every platform folder is structured identically:

- `main.tex` — the entire syllabus (single-file document; the `chapters/`, `codes/`, `images/`, `miscs/` subfolders exist but are currently empty and are not `\input`).
- `<Platform> Master Data Engineer ... Syllabus.pdf` — the compiled output committed alongside the source.
- `new 32.txt`, `new 33.txt`, `new 34.txt` — loose reference notes (curated lists of external learning resources), duplicated at the repo root. Not part of any document.

When adding real content to a syllabus, prefer expanding `main.tex` in place unless a folder grows large enough to justify splitting into `chapters/*.tex` via `\input`.

## Building a syllabus

Each `main.tex` uses `fontspec` + `babel`/`babelfont` (`\babelfont{rm}{Noto Sans}`), so it **must** be compiled with **XeLaTeX or LuaLaTeX** — plain `pdflatex` will fail. The `Noto Sans` font must be installed on the system.

Compile a single document (run from inside the platform folder, or point at its `main.tex`):

```powershell
cd AWS
latexmk -xelatex main.tex        # resolves \tableofcontents cross-refs in one pass
# or a single manual pass:
xelatex main.tex
```

Run `xelatex` twice (or use `latexmk`) so the table of contents and `hyperref` links resolve. There is no repo-wide "build all" script; compile each folder independently.

## Document conventions

All syllabi share a common preamble and four custom commands — reuse them rather than inlining formatting:

- `\dayitem{Day}{Topic}` — one weekday entry inside a `\begin{itemize}[label=-]` week block.
- `\project{...}` — a hands-on lab (renders "Hands-on Project:").
- `\usecase{...}` — an architecture scenario. Cloud folders (AWS/Azure/Fabric/GCP) render this as "Use Case & Architecture:"; `MongoDB` and `Snowflake` render it as "Real-World Architecture:". Match the sibling folder's existing label when editing.
- `\capstone{Milestone N}{...}` — a boxed monthly capstone.

Structural pattern per document: `\section{Milestone N: ... (Month N)}` → `\subsection*{Week N: ...}` → a `dayitem` list Monday–Friday, with Thursday typically a `\project` and Friday a `\usecase`. Each milestone ends with a `\capstone`. The document closes with a `longtable` tracking timetable of all 24 weeks using `$\square$` checkboxes.

Keep the six programs parallel in structure (Milestones → Weeks → daily items → capstones + final tracking table) so they stay comparable, but keep the topics platform-specific and accurate to each vendor's services.

## Editing notes

- Escape LaTeX special characters in prose: `&` → `\&`, `_` → `\_` (e.g. `PII\_Email`, `Read \& Write`).
- This is a Windows environment; use PowerShell idioms and `git --no-pager` for any git commands.
- After changing a `main.tex`, recompile that folder and update its committed `.pdf` if PDFs continue to be tracked.
