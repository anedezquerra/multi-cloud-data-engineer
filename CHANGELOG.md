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

### Planned
- Book chapters 5–24 for all six platforms (per the commented outlines in each
  `<Platform>\book\main.tex`), plus the three pending Azure, Fabric, and
  Snowflake appendices.
- Integration of the `new 3x.txt` reference notes into the book bibliographies.
