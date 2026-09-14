#!/bin/bash
# stage_a.sbatch -- Stage A: clean each raw file (array job, 12 tasks)
#SBATCH --job-name=stage_a
#SBATCH --output=logs/A_%A_%a.out
#SBATCH --array=1-12
#SBATCH --time=00:10:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
# --- environment (identical in every stage; matches the course slides) ---
module purge
module load Miniforge3/24.11.3-0
eval "$(conda shell.bash hook)"    # needed for `conda activate` in batch jobs
conda activate forschproj2627

# Simulated per-file workload; must match run_serial.sbatch for a fair
# comparison. Override with:
#   sbatch --export=ALL,TOY_WORK_SECONDS=5 stage_a.sbatch
export TOY_WORK_SECONDS="${TOY_WORK_SECONDS:-20}"

FILE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" filelist.txt)
NAME=$(basename "$FILE" .csv)
python3 clean.py "$FILE" "results/clean_${NAME}.csv"
