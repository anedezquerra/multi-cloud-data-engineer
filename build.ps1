<#
.SYNOPSIS
    Build one or all Data Engineer platform books to PDF.

.DESCRIPTION
    Each platform folder (AWS, Azure, Fabric, GCP, MongoDB, Snowflake, Databricks) contains a
    modular LaTeX book under <Platform>\book\ whose master file is main.tex.

    MiKTeX's `latexmk` requires a Perl engine that is not installed on this machine,
    so this script runs the classic multi-pass sequence that resolves citations,
    the index, and cross-references:

        pdflatex -> bibtex -> makeindex -> pdflatex -> pdflatex

.PARAMETER Target
    Which book to build: AWS, Azure, Fabric, GCP, MongoDB, Snowflake, or all (default).

.PARAMETER Clean
    Remove auxiliary files (keeps main.pdf) after a successful build.

.EXAMPLE
    .\build.ps1 -Target AWS

.EXAMPLE
    .\build.ps1                 # builds all six books

.EXAMPLE
    .\build.ps1 -Target Azure -Clean
#>
[CmdletBinding()]
param(
    [ValidateSet('AWS', 'Azure', 'Fabric', 'GCP', 'MongoDB', 'Snowflake', 'Databricks', 'all')]
    [string]$Target = 'all',

    [switch]$Clean
)

$root = $PSScriptRoot
$allBooks = 'AWS', 'Azure', 'Fabric', 'GCP', 'MongoDB', 'Snowflake', 'Databricks'
$targets = if ($Target -eq 'all') { $allBooks } else { @($Target) }

if (-not (Get-Command pdflatex -ErrorAction SilentlyContinue)) {
    throw 'pdflatex was not found on PATH. Install MiKTeX or TeX Live first.'
}

function Invoke-Pdflatex {
    param([string]$Log)
    & pdflatex -interaction=nonstopmode -halt-on-error main.tex *>> $Log
    return $LASTEXITCODE
}

$results = @()
foreach ($t in $targets) {
    $dir = Join-Path $root "$t\book"
    $main = Join-Path $dir 'main.tex'
    if (-not (Test-Path $main)) {
        Write-Warning "Skipping $t : no book found at $main"
        continue
    }

    Write-Host "==> Building $t" -ForegroundColor Cyan
    Push-Location $dir
    try {
        $log = Join-Path $env:TEMP "build_$t.log"
        if (Test-Path $log) { Remove-Item $log }

        # Pass 1 (must succeed).
        if ((Invoke-Pdflatex -Log $log) -ne 0) {
            throw "pdflatex pass 1 failed. See $log"
        }

        # Bibliography + index (warnings are non-fatal; skip index if no .idx).
        & bibtex main *>> $log
        if (Test-Path 'main.idx') { & makeindex main.idx *>> $log }

        # Two more passes to settle citations, index, TOC and cross-references.
        [void](Invoke-Pdflatex -Log $log)
        if ((Invoke-Pdflatex -Log $log) -ne 0) {
            throw "final pdflatex pass failed. See $log"
        }

        $pdf = Join-Path $dir 'main.pdf'
        if (-not (Test-Path $pdf)) { throw "no main.pdf produced. See $log" }

        $pageMatch = Select-String -Path 'main.log' -Pattern 'Output written on .*\((\d+) page' |
            Select-Object -Last 1
        $pages = if ($pageMatch) { $pageMatch.Matches.Groups[1].Value } else { '?' }
        $sizeKB = [math]::Round((Get-Item $pdf).Length / 1KB)

        Write-Host ("    OK  -  {0} pages, {1} KB" -f $pages, $sizeKB) -ForegroundColor Green
        $results += [pscustomobject]@{ Book = $t; Status = 'OK'; Pages = $pages; KB = $sizeKB }

        if ($Clean) {
            $aux = 'main.aux', 'main.log', 'main.toc', 'main.lof', 'main.lot',
                   'main.out', 'main.bbl', 'main.blg', 'main.idx', 'main.ind',
                   'main.ilg', 'main.synctex.gz'
            Remove-Item -ErrorAction SilentlyContinue $aux
            Get-ChildItem 'chapters\*.aux', 'frontmatter\*.aux', 'backmatter\*.aux' -ErrorAction SilentlyContinue |
                Remove-Item -ErrorAction SilentlyContinue
        }
    }
    catch {
        Write-Host "    FAILED: $_" -ForegroundColor Red
        $results += [pscustomobject]@{ Book = $t; Status = 'FAILED'; Pages = ''; KB = '' }
    }
    finally {
        Pop-Location
    }
}

Write-Host ''
$results | Format-Table -AutoSize

if ($results | Where-Object { $_.Status -eq 'FAILED' }) { exit 1 }
