#!/bin/bash
# stage_c.sbatch -- Stage C: merge group features into one table (single job)
#SBATCH --job-name=stage_c
#SBATCH --output=logs/C_%j.out
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
# --- environment (identical in every stage; matches the course slides) ---
module purge
module load Miniforge3/24.11.3-0
eval "$(conda shell.bash hook)"    # needed for `conda activate` in batch jobs
conda activate forschproj2627

python3 merge.py
