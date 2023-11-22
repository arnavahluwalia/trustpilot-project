{{ config(materialized='table') }}

select 
pi.number_bedrooms,
AVG(prop.price) AS average_price
from 
{{ ref('fct_properties') }} prop
left join {{ ref('properties_information') }} pi on prop.property_key = pi.property_key
group by pi.number_bedrooms