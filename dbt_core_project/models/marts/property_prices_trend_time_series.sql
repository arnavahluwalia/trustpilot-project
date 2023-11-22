{{ config(materialized='table') }}

SELECT
    DATETIME(di.year, di.month, 01, 00, 00, 00) as month,  
    AVG(prop.price) AS average_price
FROM {{ ref('fct_properties') }} prop
left join {{ ref('dates_information') }} di on prop.date_key = di.date_key
GROUP BY MONTH
ORDER BY MONTH
