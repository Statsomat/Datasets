#!/bin/bash
#SBATCH --job-name=stage_a
#SBATCH --output=logs/A_%A_%a.out
#SBATCH --array=1-12
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
module purge
module load python/3.11 2>/dev/null || true

FILE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" filelist.txt)
NAME=$(basename "$FILE" .csv)
python3 clean.py "$FILE" "results/clean_${NAME}.csv"
