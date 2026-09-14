#!/bin/bash
# stage_e.sbatch -- Stage E: select best configuration, write report (single job)
#SBATCH --job-name=stage_e
#SBATCH --output=logs/E_%j.out
#SBATCH --time=00:05:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=256M

set -euo pipefail
# --- environment (identical in every stage; matches the course slides) ---
module purge
module load Miniforge3/24.11.3-0
eval "$(conda shell.bash hook)"    # needed for `conda activate` in batch jobs
conda activate forschproj2627

python3 report.py
