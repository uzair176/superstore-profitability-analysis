/*
===============================================================================
Project: Superstore Profitability  Analysis
File: 04_discount_impact_analysis.sql
Description: Analyzing how different discount levels impact overall profit margins.
===============================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. Profitability by Discount Brackets (CASE Statement)
-- Business Reason: To find the exact discount threshold where the store starts losing money.
-- -----------------------------------------------------------------------------
SELECT 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.2 THEN 'Low Discount (1%-20%)'
        WHEN discount > 0.2 AND discount <= 0.4 THEN 'Medium Discount (21%-40%)'
        ELSE 'High Discount (>40%)'
    END AS discount_bracket,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY discount_bracket
ORDER BY total_profit DESC;

-- -----------------------------------------------------------------------------
-- 2. Which Categories Suffer the Most from Discounts?
-- Business Reason: To see if discounts are hurting furniture, tech, or supplies more.
-- -----------------------------------------------------------------------------
SELECT 
    category, 
    ROUND(AVG(discount), 2) AS average_discount, 
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_profit ASC;
