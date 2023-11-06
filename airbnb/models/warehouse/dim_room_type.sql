{{
    config(
        unique_key='listing_id'
    )
}}

select * from {{ ref('stg_room') }}