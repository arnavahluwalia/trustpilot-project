{{ config(materialized='table') }}

with location_info as (
    select distinct
        SUBSTRING(postcode, 1, STRPOS(postcode, ' ') - 1) AS postcode_outcode,
        latitude,
        longitude,
        postcode,
        address
    from {{ ref('stg_property_listings') }}
)
select 
    {{ dbt_utils.generate_surrogate_key(['latitude', 'longitude', 'address']) }} as location_key,
    *
from 
location_info

