# report.py -- Stage E worker ("build the final report")
import glob, csv

def main():
    rows, best = [], None
    for path in sorted(glob.glob("results/train_config*.csv")):
        row = next(csv.DictReader(open(path)))
        row["score"] = float(row["score"])
        row["lambda"] = float(row["lambda"])
        rows.append(row)
        if best is None or row["score"] < best["score"]:
            best = row

    with open("final_report.txt", "w") as f:
        f.write("Pipeline toy run -- final report\n")
        f.write("=" * 40 + "\n")
        for row in sorted(rows, key=lambda r: int(r["config_id"])):
            f.write(f"config {row['config_id']}: lambda={row['lambda']:.2f}  "
                    f"score={row['score']:.6f}\n")
        f.write("-" * 40 + "\n")
        f.write(f"Best: config {best['config_id']} (lambda={best['lambda']:.2f}), "
                f"score={best['score']:.6f}\n")

    print(open("final_report.txt").read())

if __name__ == "__main__":
    main()
