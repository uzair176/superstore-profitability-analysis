/*
===============================================================================
Project: Superstore Profitability Analysis
File: 02_profitability_overview.sql
Description: Breaking down profitability across key business dimensions 
             (Region, Category, Segment) to identify performance trends.
===============================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. Profitability by Region
-- Business Reason: To identify which geographical areas are driving profits 
--                  and which are lagging behind.
-- -----------------------------------------------------------------------------
SELECT 
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore_sales
GROUP BY region
ORDER BY total_profit DESC;


-- -----------------------------------------------------------------------------
-- 2. Profitability by Product Category and Sub-Category
-- Business Reason: To pinpoint exactly which types of products are the most 
--                  and least lucrative for the business overall.
-- -----------------------------------------------------------------------------
SELECT 
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore_sales
GROUP BY category, sub_category
ORDER BY total_profit DESC;


-- -----------------------------------------------------------------------------
-- 3. Profitability by Customer Segment
-- Business Reason: To understand which customer groups (Consumer, Corporate, 
--                  Home Office) bring in the most value.
-- -----------------------------------------------------------------------------
SELECT 
    segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore_sales
GROUP BY segment
ORDER BY total_profit DESC;


-- -----------------------------------------------------------------------------
-- 4. Yearly Profit Trend
-- Business Reason: To observe if overall business profitability is improving 
--                  or declining over time.
-- -----------------------------------------------------------------------------
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY order_year ASC;
