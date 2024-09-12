@echo off
setlocal

:: Define directories
set "OUTPUT_DIR=output"

:: Create directories if they do not exist
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Compile with pdflatex
pdflatex -quiet -output-directory="%OUTPUT_DIR%" -aux-directory="%OUTPUT_DIR%" main.tex

:: Run BibTeX
:: Note: BibTeX will look for the .aux file in the output directory
biber "%OUTPUT_DIR%\\main"

:: Recompile with pdflatex twice to ensure references are updated
pdflatex -quiet -output-directory="%OUTPUT_DIR%" -aux-directory="%OUTPUT_DIR%" main.tex
pdflatex -quiet -output-directory="%OUTPUT_DIR%" -aux-directory="%OUTPUT_DIR%" main.tex

:: Open current output file
start /B SumatraPDF "output/main.pdf" 

:: Pause before clear
echo Compilation completed. Output in '%OUTPUT_DIR%' directory.
endlocal
pause

:: Clear after finished
cls