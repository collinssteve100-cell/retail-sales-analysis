import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

src = Path("data/processed/retail_sales_clean.csv")
out = Path("reports")
out.mkdir(exist_ok=True)
df = pd.read_csv(src, parse_dates=["order_date"])

monthly = df.groupby("order_date").agg(sales=("sales","sum"), profit=("profit","sum")).reset_index()
plt.figure(figsize=(10,5)); plt.plot(monthly.order_date, monthly.sales, label="Sales"); plt.plot(monthly.order_date, monthly.profit, label="Profit"); plt.title("Monthly Sales and Profit"); plt.legend(); plt.tight_layout(); plt.savefig(out/"monthly_sales_profit.png"); plt.close()

cat = df.groupby("category").agg(sales=("sales","sum"), profit=("profit","sum")).sort_values("profit")
plt.figure(figsize=(8,5)); cat["profit"].plot(kind="barh"); plt.title("Profit by Category"); plt.tight_layout(); plt.savefig(out/"category_performance.png"); plt.close()

disc = df.groupby("discount").agg(margin=("profit_margin","mean")).reset_index()
plt.figure(figsize=(8,5)); plt.plot(disc.discount, disc.margin, marker="o"); plt.title("Discount vs Average Profit Margin"); plt.xlabel("Discount"); plt.ylabel("Average Profit Margin"); plt.tight_layout(); plt.savefig(out/"discount_vs_margin.png"); plt.close()
print("Reports created in reports/")