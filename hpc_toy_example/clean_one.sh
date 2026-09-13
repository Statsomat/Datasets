#!/bin/bash
# clean_one.sh -- interactive single-file test of Stage A
# (matches the salloc workflow in "Worked: Test Small Before You Test Big")
# Usage: ./clean_one.sh <input.csv> <output.csv>
set -euo pipefail
python3 clean.py "$1" "$2"
