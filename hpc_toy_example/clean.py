# clean.py -- Stage A worker ("clean one raw file")
# Usage: python3 clean.py <input.csv> <output.csv>
#
# Drops rows with a missing y value (a few are injected on purpose
# by 00_make_toy_data.sh) so later stages see complete rows only.
import sys, csv

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
    print(f"{inp} -> {outp}: kept {kept} rows")

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
