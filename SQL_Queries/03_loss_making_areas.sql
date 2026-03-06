/*
===============================================================================
Project: Superstore Profitability & Revenue Leakage Analysis
File: 03_loss_making_areas.sql
Description: Identifying specific cities, products, and sub-categories 
             that are generating negative profit (losses).
===============================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. Bottom 10 Worst-Performing Cities
-- Business Reason: To identify which specific city operations need immediate review.
-- -----------------------------------------------------------------------------
SELECT 
    city, 
    state, 
    ROUND(SUM(profit), 2) AS total_loss
FROM superstore_sales
GROUP BY city, state
HAVING SUM(profit) < 0
ORDER BY total_loss ASC
LIMIT 10;

-- -----------------------------------------------------------------------------
-- 2. Products Consistently Losing Money
-- Business Reason: Find products that cause a loss every time they are sold.
-- -----------------------------------------------------------------------------
SELECT 
    product_name, 
    category, 
    COUNT(order_id) AS times_sold_at_loss, 
    ROUND(SUM(profit), 2) AS total_loss
FROM superstore_sales
WHERE profit < 0
GROUP BY product_name, category
ORDER BY total_loss ASC
LIMIT 10;

-- -----------------------------------------------------------------------------
-- 3. CTE: Sub-Categories Dragging Down Regional Profits
-- Business Reason: Use a Common Table Expression (CTE) to isolate specific 
--                  sub-categories that ruin the profit margin of entire regions.
-- -----------------------------------------------------------------------------
WITH RegionalSubCategoryProfit AS (
    SELECT 
        region, 
        sub_category, 
        ROUND(SUM(profit), 2) AS total_profit
    FROM superstore_sales
    GROUP BY region, sub_category
)
SELECT 
    region, 
    sub_category, 
    total_profit
FROM RegionalSubCategoryProfit
WHERE total_profit < 0
ORDER BY total_profit ASC;
