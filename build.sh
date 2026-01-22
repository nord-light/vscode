#!/bin/bash

# Nord Light Theme for Visual Studio Code - Build Script
# Generates the VSIX package in outputs/

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT_DIR="$SCRIPT_DIR/outputs"

echo "Building Nord Light theme for Visual Studio Code..."

# Check if vsce is installed
if ! command -v vsce &> /dev/null; then
    echo "Error: vsce is not installed."
    echo ""
    echo "To install it, you need Node.js and npm, then run:"
    echo "  npm install -g @vscode/vsce"
    echo ""
    echo "For more info: https://github.com/microsoft/vscode-vsce"
    exit 1
fi

# Clean and create output directory
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Build the VSIX package
cd "$SCRIPT_DIR"
vsce package --allow-missing-repository --out "$OUTPUT_DIR/"

echo "Build complete: $(ls "$OUTPUT_DIR"/*.vsix)"
