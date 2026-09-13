#!/bin/bash
#SBATCH --job-name=stage_b
#SBATCH --output=logs/B_%A_%a.out
#SBATCH --array=1-4
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
module purge
module load python/3.11 2>/dev/null || true

python3 extract_features.py "${SLURM_ARRAY_TASK_ID}"
