SELECT
    orders_id
    ,date_date
    ,ROUND(SUM((margin + shipping_fee) - (logcost + ship_cost)),2) AS operational_margin
    FROM {{ ref('int_orders_margin') }} orders
    JOIN {{ ref('stg_raw__ship') }} ship
    USING(orders_id)
    GROUP BY date_date, orders_id
    ORDER BY orders_id DESC, date_date DESC
    