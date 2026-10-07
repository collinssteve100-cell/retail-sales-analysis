import pandas as pd
from pathlib import Path

raw = Path("data/raw/retail_sales_raw.csv")
out = Path("data/processed/retail_sales_clean.csv")
out.parent.mkdir(parents=True, exist_ok=True)

df = pd.read_csv(raw)
text_cols = df.select_dtypes(include="object").columns
for col in text_cols:
    df[col] = df[col].astype(str).str.strip()

df["order_date"] = pd.to_datetime(df["order_date"], errors="coerce")
df["customer_name"] = df["customer_name"].replace("nan", pd.NA)
df["customer_name"] = df["customer_name"].fillna(df["customer_id"])
df["year"] = df["order_date"].dt.year
df["month"] = df["order_date"].dt.month
df["profit_margin"] = df["profit"] / df["sales"]

assert df["order_id"].notna().all()
assert df["order_date"].notna().all()
assert (df["sales"] >= 0).all()

df.to_csv(out, index=False)
print(f"Saved {len(df):,} cleaned rows to {out}")