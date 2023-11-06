{{
    config(
        unique_key='listing_id'
    )
}}

with

source as (

    select * from {{ ref('snapshot_room') }}

),

renamed as (
    select
        listing_id as listing_id,
        scraped_date as scraped_date,
        room_type as room_type,
        accommodates as accommodates,
        price as price,
        has_availability as has_availability,
        availability_30 as availability_30,
        dbt_valid_from as dbt_valid_from,
        dbt_valid_to as dbt_valid_to
    from source
)

select * from renamed