# Reconciliation Findings

## Findings

1. The source dataset contains 300 records for the quality-control exercise.
2. Four issue types were identified for investigation: missing customer information, duplicate records, invalid dates, and unexpected status values.
3. The reconciliation example shows a 1.00% variance in record count and a 0.92% variance in total sales between the source and dashboard.
4. KPI differences should be investigated before business reporting because even small variances can affect operational decisions.

## Recommended Actions

- Standardize dashboard filters and date definitions.
- Add automated duplicate and null checks before dashboard refreshes.
- Document KPI definitions and source tables.
- Reconcile critical KPIs on a scheduled basis.
- Investigate any variance above an agreed business threshold.
