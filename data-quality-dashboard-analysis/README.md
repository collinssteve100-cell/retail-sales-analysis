# Data Quality & Dashboard Reconciliation Analysis

An end-to-end portfolio project demonstrating how to validate source data, reconcile source KPIs against dashboard figures, identify data-quality issues, and communicate reliable business metrics.

**Dataset:** Synthetic operational data created for portfolio practice. It contains no confidential information.

## Business Problem

A business intelligence dashboard reports operational KPIs, but stakeholders have identified differences between dashboard figures and the underlying source data.

The objective is to:
- Validate source data quality
- Identify missing, duplicate, and invalid records
- Calculate trusted KPIs using SQL
- Reconcile source figures against dashboard figures
- Document root causes and recommendations

## Tools

SQL, Python, Pandas, Looker / Power BI, Excel, Data Validation, KPI Reconciliation, Git/GitHub

## Project Workflow

1. Profile the source dataset
2. Run automated data-quality checks
3. Validate KPI calculations with SQL
4. Compare source KPIs with dashboard KPIs
5. Investigate variances
6. Document root causes
7. Present results through a dashboard-ready KPI framework

## Dashboard

The proposed **Data Quality & KPI Monitoring Dashboard** contains:

### KPI Cards
- Total Records
- Valid Records
- Data Quality %
- Missing Records
- Duplicate Records
- Source vs Dashboard Variance

### Visuals
- Source vs Dashboard KPI comparison
- Data-quality issues by type
- Records by status
- Missing values by field
- KPI variance by metric
- Data-quality trend over time

### Filters
- Date
- Region
- Product Category
- Agent
- Status

See [dashboard/dashboard_spec.md](dashboard/dashboard_spec.md) for the dashboard design and KPI definitions.

## Key Findings

Using the synthetic dataset and reconciliation scenario:

- **300 source records** were reviewed as part of the quality-control exercise.
- **4 data-quality issue types** were deliberately introduced for investigation: missing customer ID, duplicate record, invalid date, and unexpected status.
- The reconciliation workflow is designed to flag dashboard/source differences before KPIs are shared with stakeholders.

## Project Structure

```
data-quality-dashboard-analysis/
├── data/
│   └── raw/
│       └── source_data.csv
├── sql/
│   ├── data_quality_checks.sql
│   └── kpi_reconciliation.sql
├── scripts/
│   └── data_validation.py
├── dashboard/
│   └── dashboard_spec.md
├── reports/
│   └── reconciliation_findings.md
├── data_dictionary.csv
├── requirements.txt
└── README.md
```

## Author

**Steve Collins** — Data Analyst | SQL | Python | Looker | Power BI | Excel | Data Visualization
