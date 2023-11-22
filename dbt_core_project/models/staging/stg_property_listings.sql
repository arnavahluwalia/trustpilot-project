{{ config(materialized='table') }}

with renamed as (
    select
        price,
        type, 
        address,
        url,
        agent_url,
        number_bedrooms,
        full_description,
        agent_name,
        agent_address,
        postcode,
        longitude,
        latitude,
        propertyType as property_type,
        propertySubType as property_sub_type,
        PARSE_DATE('%Y%m%d', added) AS added_date,
        retirement,
        maxSizeFt as max_size_ft,
        preOwned as pre_owned
    from {{ source('properties_dataset', 'properties_raw') }}
    where 
        price is not null and
        type is not null and
        address is not null and
        url is not null and
        agent_url is not null and
        number_bedrooms is not null and
        full_description is not null and
        agent_name is not null and
        agent_address is not null and
        postcode is not null and
        longitude is not null and
        latitude is not null and
        added is not null and
        retirement is not null and
        preOwned is not null
    
),

duplicates_removed as (

    select
        *,
        row_number() over (partition by url order by added_date) as url_rank
    from renamed

),

final_duplicates_removed as (

    select
        *
    from duplicates_removed
    where url_rank = 1

)

select * from final_duplicates_removed

