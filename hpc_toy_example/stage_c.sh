#!/bin/bash
#SBATCH --job-name=stage_c
#SBATCH --output=logs/C_%j.out
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
module purge
module load python/3.11 2>/dev/null || true

python3 merge.py
