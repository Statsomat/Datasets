# merge.py -- Stage C worker ("merge everything into one table")
import glob, csv

def main():
    header, rows = None, []
    for path in sorted(glob.glob("results/features_group*.csv")):
        with open(path) as f:
            reader = csv.reader(f)
            h = next(reader)
            header = header or h
            rows.extend(reader)

    with open("results/merged.csv", "w", newline="") as f:
        w = csv.writer(f)
        w.writerow(header)
        w.writerows(rows)

    print(f"merged {len(rows)} group rows -> results/merged.csv")

if __name__ == "__main__":
    main()
