{{ config(materialized='table') }}

with date_info as (
    select distinct
        added_date,
        EXTRACT(YEAR FROM added_date) as year,
        EXTRACT(MONTH FROM added_date) as month,
        EXTRACT(DAY FROM added_date) as day,
        FORMAT_DATE('%A', added_date) as day_of_week,
        FORMAT_DATE('%B', added_date) as month_name
    from {{ ref('stg_property_listings') }} )
select 
{{ dbt_utils.generate_surrogate_key(['added_date']) }} AS date_key,
* 
from date_info