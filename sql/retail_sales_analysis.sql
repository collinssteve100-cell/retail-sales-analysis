-- Retail Sales & Customer Performance Analysis
-- PostgreSQL / Redshift compatible

-- 1. Overall KPIs
SELECT COUNT(*) AS orders, COUNT(DISTINCT customer_id) AS customers,
       SUM(sales) AS total_sales, SUM(profit) AS total_profit,
       SUM(profit) / NULLIF(SUM(sales),0) AS profit_margin,
       AVG(sales) AS average_order_value
FROM retail_sales_clean;

-- 2. Monthly performance
SELECT year, month, SUM(sales) AS sales, SUM(profit) AS profit
FROM retail_sales_clean
GROUP BY year, month ORDER BY year, month;

-- 3. Regional performance
SELECT region, SUM(sales) AS sales, SUM(profit) AS profit,
       SUM(profit)/NULLIF(SUM(sales),0) AS profit_margin
FROM retail_sales_clean GROUP BY region ORDER BY profit DESC;

-- 4. Category performance
SELECT category, SUM(sales) AS sales, SUM(profit) AS profit,
       SUM(profit)/NULLIF(SUM(sales),0) AS profit_margin
FROM retail_sales_clean GROUP BY category ORDER BY profit DESC;

-- 5. Sub-category profitability
SELECT sub_category, SUM(sales) AS sales, SUM(profit) AS profit
FROM retail_sales_clean GROUP BY sub_category ORDER BY profit;

-- 6. Top 10 customers
SELECT customer_id, customer_name, SUM(sales) AS sales, SUM(profit) AS profit
FROM retail_sales_clean GROUP BY customer_id, customer_name
ORDER BY sales DESC LIMIT 10;

-- 7. Discount vs profitability
SELECT discount, COUNT(*) AS orders, SUM(sales) AS sales, SUM(profit) AS profit,
       SUM(profit)/NULLIF(SUM(sales),0) AS profit_margin
FROM retail_sales_clean GROUP BY discount ORDER BY discount;

-- 8. Loss-making sub-categories
SELECT sub_category, SUM(sales) AS sales, SUM(profit) AS profit
FROM retail_sales_clean GROUP BY sub_category
HAVING SUM(profit) < 0 ORDER BY profit;