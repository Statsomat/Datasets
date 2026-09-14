#!/bin/bash
# stage_b.sbatch -- Stage B: fit one slope per group (array job, 4 tasks)
#SBATCH --job-name=stage_b
#SBATCH --output=logs/B_%A_%a.out
#SBATCH --array=1-4
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
# --- environment (identical in every stage; matches the course slides) ---
module purge
module load Miniforge3/24.11.3-0
eval "$(conda shell.bash hook)"    # needed for `conda activate` in batch jobs
conda activate forschproj2627

python3 extract_features.py "${SLURM_ARRAY_TASK_ID}"
