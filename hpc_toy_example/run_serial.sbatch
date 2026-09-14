#!/bin/bash
# run_serial.sbatch -- THE SLOW WAY (for comparison)
#
# Identical work to submit_all.sh, but as ONE job looping over all 12
# files one after another. Submit with:  bash run_serial.sh
#SBATCH --job-name=serial_all
#SBATCH --output=logs/serial_%j.out
#SBATCH --time=00:30:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=512M

set -euo pipefail
# --- environment (identical in every stage; matches the course slides) ---
module purge
module load Miniforge3/24.11.3-0
eval "$(conda shell.bash hook)"    # needed for `conda activate` in batch jobs
conda activate forschproj2627

# Must match stage_a.sbatch for the comparison to be fair
export TOY_WORK_SECONDS="${TOY_WORK_SECONDS:-20}"

echo "=== SERIAL run started: $(date) ==="
SECONDS=0

# Stage A: all 12 files, one after another (the bottleneck)
while read -r FILE; do
    NAME=$(basename "$FILE" .csv)
    python3 clean.py "$FILE" "results/clean_${NAME}.csv"
done < filelist.txt

# Stages B-E: identical to the parallel version
for g in 1 2 3 4; do python3 extract_features.py "$g"; done
python3 merge.py
for c in 1 2 3 4 5 6; do python3 train.py "$c"; done
python3 report.py

echo "=== SERIAL run finished: $(date) ==="
echo "=== Total wall-clock time: ${SECONDS} s ==="
