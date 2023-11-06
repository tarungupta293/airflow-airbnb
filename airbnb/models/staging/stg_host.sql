{{
    config(
        unique_key='listing_id'
    )
}}

with

source as (

    select * from {{ ref('snapshot_host') }}

),

renamed as (
    select
        listing_id as listing_id,
        scraped_date as scraped_date,
        host_id as host_id,
        case when host_name = 'NaN' then 'Unknown' else host_name end as host_name,
        case when host_since = 'NaN' then '2016-01-01' else host_since end as host_since,
        case when host_is_superhost = 'NaN' then 't' else host_is_superhost end as host_is_superhost,
        case when host_neighbourhood = 'NaN' then 'Sydney' else host_neighbourhood end as host_neighbourhood,
        listing_neighbourhood as listing_neighbourhood,
        dbt_valid_from as dbt_valid_from,
        dbt_valid_to as dbt_valid_to
    from source
)

select * from renamed