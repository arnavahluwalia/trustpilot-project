{{ config(materialized='table') }}

select
    {{ dbt_utils.generate_surrogate_key(['url']) }} AS property_key,
    {{ dbt_utils.generate_surrogate_key(['latitude','longitude', 'address']) }} AS location_key,
    {{ dbt_utils.generate_surrogate_key(['added_date']) }} AS date_key,
    {{ dbt_utils.generate_surrogate_key(['agent_url', 'agent_name']) }} AS agent_key,
    price
from 
{{ ref('stg_property_listings') }}