-- SELECT 
--     date_date
--     ,orders_id
--     ,ROUND(SUM(revenue),2) AS revenue
--     ,SUM(quantity) AS quantity
--     ,ROUND(SUM(purchase_cost),2) AS purchase_cost
--     ,ROUND(SUM(margin),2) AS margin
-- FROM {{ ref('int_sales_margin') }}
-- GROUP BY date_date, orders_id
-- ORDER BY orders_id DESC, date_date DESC

SELECT
  orders_id,
  max(date_date) as date_date,
  ROUND(SUM(revenue),2) as revenue,
  ROUND(SUM(quantity),2) as quantity,
  ROUND(SUM(purchase_cost),2) as purchase_cost,
  ROUND(SUM(margin),2) as margin
FROM {{ ref("int_sales_margin") }}
GROUP BY orders_id
ORDER BY orders_id DESC




