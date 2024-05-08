SELECT
     date_trunc(date_date, MONTH) as datemonth
    ,ROUND(SUM(operational_margin) - SUM(ads_cost),1) AS ads_margin
    ,ROUND(SUM(average_basket),1) AS average_basket
    ,ROUND(SUM(operational_margin),1) AS operational_margin
FROM {{ ref('int_campaigns_day') }}
JOIN {{ ref('finance_days') }}
USING(date_date)
GROUP BY datemonth
ORDER BY datemonth DESC
