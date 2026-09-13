# train.py -- Stage D worker ("train one model configuration")
# Usage: python3 train.py <config_id>
#
# Config = shrinkage strength lambda that pulls each group's slope
# toward the global (pooled) slope. Score = mean squared error on
# each group's HELD-OUT validation file (file3, never used in
# Stage B) -- a genuine bias/variance trade-off: lambda=0 overfits
# each group's training noise, lambda=1 erases real between-group
# differences; the best config is decided empirically, not by
# construction.
import sys, csv, glob

LAMBDAS = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]  # 6 configs

def main(config_id):
    lam = LAMBDAS[config_id - 1]
    feat_rows = list(csv.DictReader(open("results/merged.csv")))
    slopes = [float(r["slope"]) for r in feat_rows]
    ns = [int(r["n"]) for r in feat_rows]
    global_slope = sum(s * n for s, n in zip(slopes, ns)) / sum(ns)

    sq_err, count = 0.0, 0
    for row in feat_rows:
        g = row["group"]
        mean_x, mean_y = float(row["mean_x"]), float(row["mean_y"])
        shrunk_slope = (1 - lam) * float(row["slope"]) + lam * global_slope
        val_path = glob.glob(f"results/clean_group{g}_file3.csv")[0]
        for vrow in csv.DictReader(open(val_path)):
            x, y = float(vrow["x"]), float(vrow["y"])
            y_hat = mean_y + shrunk_slope * (x - mean_x)
            sq_err += (y - y_hat) ** 2
            count += 1
    score = sq_err / count  # held-out MSE, lower is better

    with open(f"results/train_config{config_id}.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(["config_id", "lambda", "score"])
        w.writerow([config_id, lam, score])

    print(f"config {config_id} (lambda={lam}): held-out MSE={score:.4f}")

if __name__ == "__main__":
    main(int(sys.argv[1]))
