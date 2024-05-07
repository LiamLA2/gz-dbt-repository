SELECT sales.*
    ,product.purchase_price
    ,ROUND(quantity * purchase_price,2) AS purchase_cost
    ,ROUND(revenue - (quantity * purchase_price), 2) AS margin
FROM {{ref("stg_raw__sales")}} sales
JOIN {{ref("stg_raw__product")}} product
USING (products_id)
