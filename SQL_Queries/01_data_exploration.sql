/*
===============================================================================
Project: Superstore Profitability Analysis
File: 01_data_exploration.sql

===============================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. Total Number of Records
-- Business Reason: To understand the overall scale of the dataset we are analyzing.
-- -----------------------------------------------------------------------------
SELECT 
    COUNT(*) AS total_records 
FROM superstore_sales;


-- -----------------------------------------------------------------------------
-- 2. Date Range of the Dataset
-- Business Reason: To know the exact timeframe of the sales data (e.g., how many years).
-- -----------------------------------------------------------------------------
SELECT 
    MIN(order_date) AS first_order_date, 
    MAX(order_date) AS last_order_date 
FROM superstore_sales;


-- -----------------------------------------------------------------------------
-- 3. Overall High-Level KPIs (Sales, Profit, and Profit Margin)
-- Business Reason: To establish the baseline business health before digging into losses.
-- -----------------------------------------------------------------------------
SELECT 
    ROUND(SUM(sales), 2) AS total_sales, 
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS overall_profit_margin_percentage
FROM superstore_sales;


-- -----------------------------------------------------------------------------
-- 4. Checking for Data Integrity (Duplicates)
-- Business Reason: To ensure our profit calculations won't be skewed by duplicate entries.
-- -----------------------------------------------------------------------------
SELECT 
    order_id, 
    product_id, 
    COUNT(*) as duplicate_count
FROM superstore_sales
GROUP BY 
    order_id, 
    product_id
HAVING COUNT(*) > 1;


-- -----------------------------------------------------------------------------
-- 5. Understanding the Business Dimensions
-- Business Reason: To see how many unique regions, categories, and segments we need to analyze.
-- -----------------------------------------------------------------------------
SELECT 
    COUNT(DISTINCT region) AS total_regions, 
    COUNT(DISTINCT category) AS total_categories, 
    COUNT(DISTINCT sub_category) AS total_sub_categories,
    COUNT(DISTINCT segment) AS total_customer_segments
FROM superstore_sales;
