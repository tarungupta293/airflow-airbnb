{{
    config(
        unique_key='lga_code'
    )
}}

select * from {{ ref('stg_nsw_lga_code') }}