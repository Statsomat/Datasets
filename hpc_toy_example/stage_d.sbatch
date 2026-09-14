#!/bin/bash
# stage_d.sbatch -- Stage D: score one model configuration (array job, 6 tasks)
#SBATCH --job-name=stage_d
#SBATCH --output=logs/D_%A_%a.out
#SBATCH --array=1-6
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
# --- environment (identical in every stage; matches the course slides) ---
module purge
module load Miniforge3/24.11.3-0
eval "$(conda shell.bash hook)"    # needed for `conda activate` in batch jobs
conda activate forschproj2627

python3 train.py "${SLURM_ARRAY_TASK_ID}"
