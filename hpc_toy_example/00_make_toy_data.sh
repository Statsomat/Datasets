#!/bin/bash
# ---------------------------------------------------------------
# 00_make_toy_data.sh
#
# Generates the synthetic dataset that stands in for "raw/*.csv"
# in hpc_course.tex, scaled down so the whole 5-stage pipeline
# (A-E) runs in seconds instead of days:
#
#   4 groups x 3 files/group = 12 raw files   (real deck: 4800 files)
#   4 groups                                  (real deck: 48 groups)
#   6 model configs                           (real deck: 24 configs)
#
# Each group has a genuinely different true slope (not just a
# different offset), and one file per group (file3) is reserved as
# held-out validation data -- so the shrinkage config chosen in
# Stage D resolves a real bias/variance trade-off (verified to give
# a non-trivial interior optimum, not one config winning by
# construction).
#
# Run this ONCE, on the login node, before submitting stage_a.sh.
# ---------------------------------------------------------------
set -euo pipefail
mkdir -p raw results logs

python3 << 'PY'
import random
random.seed(2)  # tuned: gives a clean interior-optimum shrinkage curve

N_GROUPS = 4
POINTS_PER_FILE = 15
NOISE_SD = 6.0
SLOPES = [1.3, 1.7, 2.3, 2.7]  # distinct true slope per group

for g, slope in enumerate(SLOPES, start=1):
    for n in range(1, 4):  # file1, file2 = training; file3 = held-out validation
        path = f"raw/group{g}_file{n}.csv"
        with open(path, "w") as fh:
            fh.write("x,y\n")
            for _ in range(POINTS_PER_FILE):
                x = random.uniform(0, 10)
                y = slope * x + random.gauss(0, NOISE_SD)
                if random.random() < 0.05:
                    fh.write(f"{x:.4f},\n")  # a few missing values, on purpose
                else:
                    fh.write(f"{x:.4f},{y:.4f}\n")
print(f"Generated {N_GROUPS*3} raw files across {N_GROUPS} groups (true slopes: {SLOPES}).")
PY

ls raw/*.csv > filelist.txt
