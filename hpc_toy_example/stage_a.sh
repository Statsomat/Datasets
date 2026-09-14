#!/bin/bash
#SBATCH --job-name=stage_a
#SBATCH --output=logs/A_%A_%a.out
#SBATCH --array=1-12
#SBATCH --time=00:10:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
module purge
module load Python/3.14.2-GCCcore-15.2.0 2>/dev/null || true

# Simulated per-file workload; must match run_serial.sbatch for a fair
# comparison. Override on submission with:  sbatch --export=ALL,TOY_WORK_SECONDS=5 stage_a.sh
export TOY_WORK_SECONDS="${TOY_WORK_SECONDS:-20}"

FILE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" filelist.txt)
NAME=$(basename "$FILE" .csv)
python3 clean.py "$FILE" "results/clean_${NAME}.csv"