/*
===============================================================================
Project: Superstore Profitability Analysis
File: 05_top_customers_ranking.sql
Description: Ranking the most and least profitable customers within segments.
===============================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. Top 3 Most Profitable Customers Per Segment (Window Function)
-- Business Reason: Identify VIP customers in each segment for loyalty programs.
-- -----------------------------------------------------------------------------
WITH CustomerProfitability AS (
    SELECT 
        segment,
        customer_name,
        ROUND(SUM(profit), 2) AS total_profit,
        DENSE_RANK() OVER(PARTITION BY segment ORDER BY SUM(profit) DESC) AS profit_rank
    FROM superstore_sales
    GROUP BY segment, customer_name
)
SELECT 
    segment, 
    customer_name, 
    total_profit, 
    profit_rank
FROM CustomerProfitability
WHERE profit_rank <= 3;

-- -----------------------------------------------------------------------------
-- 2. The Biggest Revenue Leakers (Least Profitable Customers)
-- Business Reason: Identify customers who cost the company the most money 
--                  (usually due to excessive returns or high discounts).
-- -----------------------------------------------------------------------------
WITH CustomerLosses AS (
    SELECT 
        customer_name,
        ROUND(SUM(sales), 2) AS total_sales,
        ROUND(SUM(profit), 2) AS total_profit,
        RANK() OVER(ORDER BY SUM(profit) ASC) AS loss_rank
    FROM superstore_sales
    GROUP BY customer_name
    HAVING SUM(profit) < 0
)
SELECT 
    customer_name, 
    total_sales, 
    total_profit, 
    loss_rank
FROM CustomerLosses
WHERE loss_rank <= 10;
