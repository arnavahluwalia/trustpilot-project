
{{ config(materialized='table') }}


select
    ai.agent_name,
    count(*) as listings_count
FROM {{ ref('fct_properties') }} prop
left join {{ ref('agents_information') }} ai on prop.agent_key = ai.agent_key
group by ai.agent_name

