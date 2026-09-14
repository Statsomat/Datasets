#!/bin/bash
# ---------------------------------------------------------------
# after_job.sh -- report runtime and resource usage for one job,
# or for a whole chain of jobs (the parallel pipeline submits five).
#
# Replaces `seff`, which is not installed on every cluster.
# Uses only core Slurm commands (sacct, scontrol).
#
# Usage:
#   bash after_job.sh <JOBID> [<JOBID> ...]
#   bash after_job.sh $(cat .last_run_jobids)    # after submit_all.sh
#   bash after_job.sh                            # same, reads the file
#
# For several job IDs it also reports the TOTAL WALL-CLOCK SPAN of
# the chain: earliest start to latest end. That is the number to
# compare against the serial run.
# ---------------------------------------------------------------
set -uo pipefail

JOBIDS=("$@")

# No arguments: fall back to the ids recorded by submit_all.sh
if [ ${#JOBIDS[@]} -eq 0 ]; then
    if [ -f .last_run_jobids ]; then
        read -r -a JOBIDS < .last_run_jobids
    else
        echo "Usage: bash after_job.sh <JOBID> [<JOBID> ...]"
        echo "   or: run submit_all.sh first, then: bash after_job.sh"
        exit 1
    fi
fi

echo "=== Per-job summary ==="
printf '%-14s %-12s %-11s %-10s %-10s %-9s %s\n' \
       JobID JobName State Elapsed TotalCPU ReqMem MaxRSS
for id in "${JOBIDS[@]}"; do
    sacct -j "$id" -n -P \
        --format=JobID,JobName,State,Elapsed,TotalCPU,ReqMem,MaxRSS \
    | awk -F'|' '$1 !~ /\.(batch|extern)$/ {
          printf "%-14s %-12s %-11s %-10s %-10s %-9s %s\n",$1,$2,$3,$4,$5,$6,$7 }'
done

# --- total wall-clock span across every job and array task ---
echo
echo "=== Total wall-clock span ==="
min_start=""; max_end=""
for id in "${JOBIDS[@]}"; do
    while IFS='|' read -r st en; do
        # skip rows without a usable timestamp
        [[ "$st" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}T ]] || continue
        s=$(date -d "$st" +%s 2>/dev/null) || continue
        [ -z "$min_start" ] && min_start=$s
        [ "$s" -lt "$min_start" ] && min_start=$s
        [[ "$en" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}T ]] || continue
        e=$(date -d "$en" +%s 2>/dev/null) || continue
        [ -z "$max_end" ] && max_end=$e
        [ "$e" -gt "$max_end" ] && max_end=$e
    done < <(sacct -j "$id" -n -P --format=Start,End)
done

if [ -n "$min_start" ] && [ -n "$max_end" ]; then
    span=$(( max_end - min_start ))
    printf 'First job started: %s\n' "$(date -d @"$min_start" '+%Y-%m-%d %H:%M:%S')"
    printf 'Last job ended:    %s\n' "$(date -d @"$max_end"   '+%Y-%m-%d %H:%M:%S')"
    printf 'TOTAL SPAN:        %d s  (%02d:%02d:%02d)\n' \
           "$span" $((span/3600)) $((span%3600/60)) $((span%60))
    echo
    echo "Compare this figure between the serial and the parallel run."
else
    echo "No completed timestamps yet -- is the chain still running?"
    echo "Check with: squeue -u \$USER"
fi
