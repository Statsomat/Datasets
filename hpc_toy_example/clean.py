# clean.py -- Stage A worker ("clean one raw file")
# Usage: python3 clean.py <input.csv> <output.csv>
#
# Drops rows with a missing y value (a few are injected on purpose
# by 00_make_toy_data.sh) so later stages see complete rows only.
#
# TOY_WORK_SECONDS (environment variable, default 0):
#   Adds this many seconds of REAL CPU work per file. The cleaning
#   itself takes ~0.02 s, far too fast to show any difference between
#   serial and parallel execution. Setting e.g. TOY_WORK_SECONDS=20
#   simulates a realistically expensive per-file computation so the
#   serial-vs-parallel comparison is visible. Real CPU work (not
#   sleep) is used so that sacct/TotalCPU reports meaningful numbers.
import sys, csv, os, time

def burn_cpu(seconds):
    """Do genuine arithmetic for approximately `seconds` of CPU time."""
    if seconds <= 0:
        return
    end = time.time() + seconds
    x = 0.0
    while time.time() < end:
        for i in range(10000):
            x += i ** 0.5
    return x

def main(inp, outp):
    with open(inp) as f_in, open(outp, "w", newline="") as f_out:
        reader = csv.DictReader(f_in)
        writer = csv.DictWriter(f_out, fieldnames=["x", "y"])
        writer.writeheader()
        kept = 0
        for row in reader:
            if row["y"] == "":
                continue
            writer.writerow(row)
            kept += 1

    burn_cpu(float(os.environ.get("TOY_WORK_SECONDS", "0")))
    print(f"{inp} -> {outp}: kept {kept} rows")

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])