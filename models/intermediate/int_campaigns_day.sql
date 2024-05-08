SELECT 
    date_date
    ,ROUND(SUM(ads_cost),1) AS ads_cost
    ,ROUND(SUM(impression),1) AS ads_impression
    ,ROUND(SUM(click),1) AS ads_clicks
    FROM {{ ref('int_campaigns') }}
    GROUP BY date_date 
    ORDER BY date_date ASC