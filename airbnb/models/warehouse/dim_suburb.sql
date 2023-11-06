{{
    config(
        unique_key='lga_name'
    )
}}

select * from {{ ref('stg_nsw_suburb') }}