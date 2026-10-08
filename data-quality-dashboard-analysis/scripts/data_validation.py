import pandas as pd
from pathlib import Path

src = Path("data/raw/source_data.csv")
df = pd.read_csv(src)

results = {
    "total_records": len(df),
    "missing_customer_id": int(df["customer_id"].isna().sum()),
    "missing_transaction_date": int(df["transaction_date"].isna().sum()),
    "duplicate_record_ids": int(df["record_id"].duplicated().sum()),
    "unexpected_status": int((~df["status"].isin(["Active", "Inactive"])).sum()),
}

valid = (
    df["customer_id"].notna()
    & pd.to_datetime(df["transaction_date"], errors="coerce").notna()
    & df["status"].isin(["Active", "Inactive"])
)

results["valid_records"] = int(valid.sum())
results["data_quality_pct"] = round(valid.mean() * 100, 2)

print("Data Quality Summary")
print("-" * 24)
for key, value in results.items():
    print(f"{key}: {value}")
