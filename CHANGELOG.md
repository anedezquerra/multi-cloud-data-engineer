# Changelog

All notable changes to this repository are documented here.

## [Unreleased]

### Added
- Expanded all six platform syllabi (`main.tex`) with prerequisites/how-to-use
  sections and weekly `\rubric`, `\resources`, `\selfcheck`, and `\prodnote`
  commands.
- Added modular book skeleton (`<Platform>\book\`) for all six platforms:
  frontmatter, preamble, glossary, references, chapters 0–4, and a
  cross-cloud-equivalence appendix (~105–112 pages per book).
- Added `build.ps1` for multi-pass `pdflatex`/`bibtex`/`makeindex` builds of all books.
- Added root `README.md`, `CHANGELOG.md`, and `.gitignore` for LaTeX build artifacts.

### Added
- Completed all six books: chapters 5–24 for every platform (~290–330 pages per
  book), each chapter mapped to the matching syllabus week, plus the Azure,
  Fabric, and Snowflake appendices (A–C).
- Added a "Curated Community Resources" section (case studies, video courses,
  GitHub repositories) to each book's Chapter 0, integrating the former
  `new 3x.txt` loose notes.

### Removed
- Deleted the `new 32.txt`, `new 33.txt`, `new 34.txt` loose notes from the
  repo root and all six platform folders (content integrated into the books).

### Added
- New seventh platform: Databricks 24-week syllabus (`Databricks\main.tex`)
  and full book (`Databricks\book\`, chapters 0–24 + appendices), integrated
  into `build.ps1`.
- Standardized appendix set across all seven books: cross-cloud equivalence
  extended through Chapter 24 (now covering all seven platforms including
  Databricks), environment setup, CLI/SQL quick reference, production and
  governance checklists, lab/exercise solutions, certification exam-objective
  mapping, and a consolidated interview question bank.
