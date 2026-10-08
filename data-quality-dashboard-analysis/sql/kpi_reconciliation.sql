-- Source vs Dashboard KPI Reconciliation
-- Replace dashboard_kpis with the exported dashboard KPI table.

WITH source_kpis AS (
    SELECT
        COUNT(*) AS total_records,
        COUNT(DISTINCT customer_id) AS customers,
        SUM(sales_amount) AS total_sales,
        SUM(CASE WHEN status = 'Active' THEN 1 ELSE 0 END) AS active_records
    FROM source_data
),
reconciliation AS (
    SELECT
        s.total_records,
        d.total_records AS dashboard_total_records,
        s.total_sales,
        d.total_sales AS dashboard_total_sales,
        s.active_records,
        d.active_records AS dashboard_active_records
    FROM source_kpis s
    CROSS JOIN dashboard_kpis d
)
SELECT
    *,
    total_records - dashboard_total_records AS record_variance,
    total_sales - dashboard_total_sales AS sales_variance,
    active_records - dashboard_active_records AS active_variance
FROM reconciliation;

-- Variance percentage
SELECT
    metric,
    source_value,
    dashboard_value,
    source_value - dashboard_value AS variance,
    CASE WHEN source_value = 0 THEN NULL
         ELSE 100.0 * (source_value - dashboard_value) / source_value
    END AS variance_pct
FROM (
    SELECT 'Total Records' AS metric, 300.0 AS source_value, 297.0 AS dashboard_value
    UNION ALL
    SELECT 'Total Sales', 1666500.00, 1651200.00
    UNION ALL
    SELECT 'Active Records', 150.0, 149.0
) x;
