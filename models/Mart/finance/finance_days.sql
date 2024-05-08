-- SELECT
--     date_date
--     ,ROUND(SUM(revenue),0) AS revenue
--     ,SUM(margin)
--     ,SUM(operational_margin)
--     ,COUNT(orders_id) AS nb_transactions
--     ,ROUND(SUM(revenue)/COUNT(orders_id),2) AS average_basket
--     FROM {{ ref('int_orders_operational') }} operational
--     GROUP BY date_date, orders_id
--     ORDER BY date_date



SELECT
    date_date
    ,COUNT(orders_id) AS nb_transactions
    ,ROUND(SUM(revenue),0) AS revenue 
    ,ROUND(AVG(revenue),1) AS average_basket
    ,ROUND(SUM(revenue)/COUNT(orders_id),1) AS average_basket_bis
    ,ROUND(SUM(margin),0) AS margin 
    ,ROUND(SUM(operational_margin),0) AS operational_margin 
    ,ROUND(SUM(purchase_cost),0) AS purchase_cost 
    ,ROUND(SUM(shipping_fee),0) AS shipping_fee 
    ,ROUND(SUM(logcost),0) AS logcost 
    ,ROUND(SUM(ship_cost),0) AS ship_cost 
    ,SUM(quantity) AS quantity 
FROM {{ref("int_orders_operational")}}
GROUP BY  date_date
ORDER BY  date_date DESC