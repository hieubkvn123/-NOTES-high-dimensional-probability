#!/bin/bash

# Define directories
OUTPUT_DIR="output"

# Create directories if they do not exist
mkdir -p "$OUTPUT_DIR"

# Compile with pdflatex
pdflatex -quiet -output-directory="$OUTPUT_DIR" -aux-directory="$OUTPUT_DIR" main.tex

# Run Biber
# Note: Biber will look for the .aux file in the output directory
biber "$OUTPUT_DIR/main"

# Recompile with pdflatex twice to ensure references are updated
pdflatex -quiet -output-directory="$OUTPUT_DIR" -aux-directory="$OUTPUT_DIR" main.tex
pdflatex -quiet -output-directory="$OUTPUT_DIR" -aux-directory="$OUTPUT_DIR" main.tex

# Open the output file with a PDF viewer
# Adjust the command below based on the PDF viewer installed on your system
xdg-open "$OUTPUT_DIR/main.pdf" &

# Notify completion
echo "Compilation completed. Output in '$OUTPUT_DIR' directory."

# Pause and wait for user input
read -p "Press [Enter] to clear the terminal and exit..."

# Clear the terminal screen
clear