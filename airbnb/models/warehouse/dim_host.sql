{{
    config(
        unique_key='host_id'
    )
}}

select * from {{ ref('stg_host') }}