{{ config(materialized='table') }}

select
    pi.number_bedrooms,
    min(prop.price) as min_price
FROM {{ ref('fct_properties') }} prop
left join {{ ref('properties_information') }} pi on prop.property_key = pi.property_key
group by number_bedrooms

