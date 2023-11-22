{{ config(materialized='table') }}

with properties_info as (
    select distinct
        url, 
        price, 
        type, 
        number_bedrooms, 
        full_description, 
        retirement, 
        pre_owned
    from {{ ref('stg_property_listings') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['url']) }} AS property_key,
    *
from properties_info

