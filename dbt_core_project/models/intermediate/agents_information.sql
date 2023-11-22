{{ config(materialized='table') }}


with agents_info as (
    select distinct
        agent_url, 
        agent_name,
        agent_address
    from {{ ref('stg_property_listings') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['agent_url', 'agent_name']) }} AS agent_key,
    *
from agents_info

