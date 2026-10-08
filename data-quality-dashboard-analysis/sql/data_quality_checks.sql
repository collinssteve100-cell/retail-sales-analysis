-- Data Quality Checks
-- PostgreSQL / Redshift compatible

-- 1. Total records
SELECT COUNT(*) AS total_records
FROM source_data;

-- 2. Missing customer IDs
SELECT COUNT(*) AS missing_customer_ids
FROM source_data
WHERE customer_id IS NULL OR TRIM(customer_id) = '';

-- 3. Duplicate records
SELECT record_id, COUNT(*) AS record_count
FROM source_data
GROUP BY record_id
HAVING COUNT(*) > 1;

-- 4. Invalid dates
SELECT COUNT(*) AS invalid_dates
FROM source_data
WHERE transaction_date IS NULL;

-- 5. Unexpected statuses
SELECT status, COUNT(*) AS record_count
FROM source_data
GROUP BY status
ORDER BY record_count DESC;

-- 6. Data quality pass rate
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN customer_id IS NOT NULL
              AND transaction_date IS NOT NULL
              AND status IN ('Active','Inactive')
             THEN 1 ELSE 0 END) AS valid_records,
    100.0 * SUM(CASE WHEN customer_id IS NOT NULL
                      AND transaction_date IS NOT NULL
                      AND status IN ('Active','Inactive')
                     THEN 1 ELSE 0 END) / COUNT(*) AS data_quality_pct
FROM source_data;
