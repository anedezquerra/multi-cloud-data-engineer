# latexmkrc ? build configuration for `latexmk`.
# Run `latexmk` (no args) to build main.tex as PDF; `latexmk -c` to clean.

$pdf_mode = 1;          # produce PDF via pdflatex
@default_files = ('main.tex');
$out_dir = '.';

# Always run bibtex when the document uses \bibliography, so citations and the
# Bibliography chapter resolve without a manual bibtex pass.
$bibtex_use = 2;

# Treat included-chapter aux files as cleanable extras.
$clean_ext = 'synctex.gz run.xml bbl';
