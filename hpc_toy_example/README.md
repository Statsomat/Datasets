# hpc_toy_example

A small, self-contained Slurm pipeline used in the HPC course. It runs a
five-stage pipeline two ways -- serially and in parallel -- so the runtime
difference can be measured.

No data needs to be downloaded: `00_make_toy_data.sh` generates it from a
fixed random seed, so every user gets identical files.

## Naming convention

- `.py`      the computation
- `.sbatch`  a Slurm job (submit with `sbatch`)
- `.sh`      a plain shell script (run with `bash`)

## Requirements

A Conda environment named `forschproj2627`. Every `.sbatch` file begins with:

```bash
module purge
module load Miniforge3/24.11.3-0
eval "$(conda shell.bash hook)"
conda activate forschproj2627
```

Adjust the module name and environment name to match your site if they differ.
Only the Python standard library is used, so no extra packages are required.

## Quick start

```bash
chmod +x *.sh
bash 00_make_toy_data.sh   # generate raw/*.csv and filelist.txt

bash submit_all.sh         # parallel: array jobs + dependency chain
# or
bash run_serial.sh         # serial: one job, 12 files one after another

bash after_job.sh          # timing readout for whichever you just ran
```

Both routes produce an identical `final_report.txt`. Only the scheduling
differs.

## The pipeline

| Stage | What it does | Shape |
|---|---|---|
| A | Clean each raw file | array, 12 tasks |
| B | Fit one slope per group | array, 4 tasks |
| C | Merge group features into one table | single job |
| D | Score one model configuration | array, 6 tasks |
| E | Select the best configuration, write report | single job |

Stages A, B and D split into independent tasks; C and E must wait for
everything before them. The stages are chained with
`--dependency=afterok`.

## Files

| File | Purpose |
|---|---|
| `00_make_toy_data.sh` | Generates `raw/*.csv` and `filelist.txt` |
| `clean.py` | Stage A worker: drops rows with a missing value |
| `stage_a.sbatch` | Stage A array job, 12 tasks |
| `clean_one.sh` | Runs `clean.py` on a single file, for testing |
| `extract_features.py` | Stage B worker: fits one slope per group |
| `stage_b.sbatch` | Stage B array job, 4 tasks |
| `merge.py` | Stage C: combines group features into one table |
| `stage_c.sbatch` | Stage C single job |
| `train.py` | Stage D worker: scores one model configuration |
| `stage_d.sbatch` | Stage D array job, 6 tasks |
| `report.py` | Stage E: selects the best configuration |
| `stage_e.sbatch` | Stage E single job |
| `submit_all.sh` | Submits all five stages, chained (parallel run) |
| `run_serial.sh` | Submits `run_serial.sbatch` (serial run) |
| `run_serial.sbatch` | The serial job itself: same work, one job |
| `after_job.sh` | Timing and memory readout for the last run |

## Timing knob

The real per-file work takes about 0.02 s -- far too fast to show any
difference between serial and parallel execution. `TOY_WORK_SECONDS`
(default 20) adds that many seconds of genuine CPU work per file:

```bash
sbatch --export=ALL,TOY_WORK_SECONDS=5 stage_a.sbatch
```

`stage_a.sbatch` and `run_serial.sbatch` read the same variable, so the
comparison stays fair. Real arithmetic is used rather than `sleep`, so
`sacct` reports meaningful CPU time.

## Reading the result

`after_job.sh` replaces `seff`, which is not installed on every cluster. It
uses only `sacct` and `scontrol`, and reports:

- per-job state, elapsed time, CPU time, memory requested vs. used
- the **total wall-clock span** of the whole chain, first start to last end

The span is the figure to compare between the two runs. Summing the
individual elapsed times would be wrong, since the parallel tasks overlap.

Both launchers record their job ids in `.last_run_jobids`, so `after_job.sh`
can be called with no arguments. It also accepts explicit ids:

```bash
bash after_job.sh 1234567 1234568
```
