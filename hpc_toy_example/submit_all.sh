#!/bin/bash
# submit_all.sh -- chain all five stages (matches "Chaining the Stages"
# in hpc_course.tex). Run once, on the login node, AFTER
# 00_make_toy_data.sh.
set -euo pipefail
mkdir -p logs results

JID_A=$(sbatch --parsable stage_a.sh)
JID_B=$(sbatch --parsable --dependency=afterok:$JID_A stage_b.sh)
JID_C=$(sbatch --parsable --dependency=afterok:$JID_B stage_c.sh)
JID_D=$(sbatch --parsable --dependency=afterok:$JID_C stage_d.sh)
JID_E=$(sbatch --parsable --dependency=afterok:$JID_D stage_e.sh)

echo "Submitted: A=$JID_A B=$JID_B C=$JID_C D=$JID_D E=$JID_E"
