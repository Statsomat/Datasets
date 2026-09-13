# extract_features.py -- Stage B worker ("extract features per group")
# Usage: python3 extract_features.py <group_id>
#
# Reads only the TRAINING files for one group (file1, file2 -- file3
# is reserved as held-out validation data for Stage D) and fits a
# trivial one-predictor least-squares slope.
import sys, glob, csv, statistics as st

def main(group):
    xs, ys = [], []
    train_files = sorted(glob.glob(f"results/clean_group{group}_file[12].csv"))
    for path in train_files:
        with open(path) as f:
            for row in csv.DictReader(f):
                xs.append(float(row["x"]))
                ys.append(float(row["y"]))

    n = len(xs)
    mean_x, mean_y = st.mean(xs), st.mean(ys)
    cov = sum((x - mean_x) * (y - mean_y) for x, y in zip(xs, ys))
    var = sum((x - mean_x) ** 2 for x in xs)
    slope = cov / var if var > 0 else 0.0

    with open(f"results/features_group{group}.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["group", "n", "mean_x", "mean_y", "slope"])
        w.writerow([group, n, mean_x, mean_y, slope])

    print(f"group {group}: n={n} slope={slope:.4f}")

if __name__ == "__main__":
    main(int(sys.argv[1]))
