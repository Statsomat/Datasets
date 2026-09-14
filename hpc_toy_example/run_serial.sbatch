#!/bin/bash
# ---------------------------------------------------------------
# run_serial.sbatch -- THE SLOW WAY (for comparison)
#
# Runs the identical work as submit_all.sh, but as ONE job that
# loops over all 12 files one after another. This is what the
# pipeline looks like before parallelization.
#
# Submit with:  sbatch run_serial.sbatch
# Then compare against:  bash submit_all.sh   (the parallel version)
# ---------------------------------------------------------------
#SBATCH --job-name=serial_all
#SBATCH --output=logs/serial_%j.out
#SBATCH --time=00:30:00
#SBATCH --cpus-per-task=1
#SBATCH --mem=512M

set -euo pipefail
module purge
module load Python/3.14.2-GCCcore-15.2.0 2>/dev/null || true

# Must match stage_a.sh for the comparison to be fair
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
