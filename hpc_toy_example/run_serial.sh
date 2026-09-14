#!/bin/bash
# run_serial.sh -- submits the serial version and records its job id,
# so it can be read with the same command as the parallel run.
set -euo pipefail
mkdir -p logs results

JID=$(sbatch --parsable run_serial.sbatch)
echo "Submitted serial job: $JID"
echo "$JID" > .last_run_jobids
echo "When it finishes:  bash after_job.sh"
