{{ config(materialized='table') }}

select 
li.postcode_outcode,
AVG(prop.price) AS average_price
from 
{{ ref('fct_properties') }} prop
left join {{ ref('location_information') }} li on prop.location_key = li.location_key
group by li.postcode_outcode