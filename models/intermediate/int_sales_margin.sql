-- SELECT sales.*
--     ,product.purchase_price
--     ,ROUND(quantity * purchase_price,2) AS purchase_cost
--     ,ROUND(revenue - (quantity * purchase_price), 2) AS margin
-- FROM {{ref("stg_raw__sales")}} sales
-- JOIN {{ref("stg_raw__product")}} product
-- USING (products_id)

SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    CAST(purchase_price AS FLOAT64), 
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
    USING (products_id)