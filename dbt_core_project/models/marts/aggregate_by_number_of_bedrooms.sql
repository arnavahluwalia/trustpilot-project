{{ config(materialized='table') }}

select
    pi.number_bedrooms,
    count(*) as listings_count
from {{ ref('fct_properties') }} prop
left join {{ ref('properties_information') }} pi on prop.property_key = pi.property_key
group by pi.number_bedrooms

