#!/bin/bash
# submit_all.sh -- THE PARALLEL WAY
# Submits all five stages as a dependency chain. Stages A, B and D
# are array jobs, so their tasks run concurrently.
#
# Run once, on the login node, AFTER 00_make_toy_data.sh.
# Then read the timing with:  bash after_job.sh
set -euo pipefail
mkdir -p logs results

JID_A=$(sbatch --parsable stage_a.sbatch)
JID_B=$(sbatch --parsable --dependency=afterok:$JID_A stage_b.sbatch)
JID_C=$(sbatch --parsable --dependency=afterok:$JID_B stage_c.sbatch)
JID_D=$(sbatch --parsable --dependency=afterok:$JID_C stage_d.sbatch)
JID_E=$(sbatch --parsable --dependency=afterok:$JID_D stage_e.sbatch)

echo "Submitted: A=$JID_A B=$JID_B C=$JID_C D=$JID_D E=$JID_E"

# Record the ids so after_job.sh can report the total span without
# you having to copy five numbers by hand.
echo "$JID_A $JID_B $JID_C $JID_D $JID_E" > .last_run_jobids
echo "Job ids saved to .last_run_jobids"
echo "When the chain finishes:  bash after_job.sh"
