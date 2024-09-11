@echo off
setlocal

:: Define directories
set "OUTPUT_DIR=output"
set "AUX_DIR=output"

:: Create directories if they do not exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"
if not exist "%AUX_DIR%" mkdir "%AUX_DIR%"

:: Compile with pdflatex
pdflatex -quiet -output-directory="%OUTPUT_DIR%" -aux-directory="%AUX_DIR%" main.tex

:: Run BibTeX
:: Note: BibTeX will look for the .aux file in the output directory
biber "%AUX_DIR%\\main"

:: Recompile with pdflatex twice to ensure references are updated
pdflatex -quiet -output-directory="%OUTPUT_DIR%" -aux-directory="%AUX_DIR%" main.tex
pdflatex -quiet -output-directory="%OUTPUT_DIR%" -aux-directory="%AUX_DIR%" main.tex

echo Compilation completed. Output in '%OUTPUT_DIR%' directory.

:: Pause before clear
endlocal
pause

:: Clear after finished
cls