# Dashboard Specification

## Page 1 — KPI Overview

### KPI Cards
1. Total Records
2. Valid Records
3. Data Quality %
4. Missing Records
5. Duplicate Records
6. KPI Variance %

### Main Charts
- **Source vs Dashboard KPIs:** clustered column chart
- **Data Quality Issues:** bar chart by issue type
- **Records by Status:** donut or column chart
- **Sales by Region:** bar chart

## Page 2 — Reconciliation

Show a table containing:

| KPI | Source | Dashboard | Variance | Variance % |
|---|---:|---:|---:|---:|
| Total Records | 300 | 297 | 3 | 1.00% |
| Total Sales | 1,666,500 | 1,651,200 | 15,300 | 0.92% |
| Active Records | 150 | 149 | 1 | 0.67% |

## Recommended Filters

- Transaction date
- Region
- Product category
- Agent
- Status

## Business Use

The dashboard should make it easy for a data analyst or business stakeholder to answer:

- Can we trust the current KPI?
- Where are the data-quality problems?
- Which dashboard metrics do not reconcile with the source?
- What needs to be fixed before reporting?
