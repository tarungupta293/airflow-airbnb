{{
    config(
        unique_key='lga_code'
    )
}}

with

source  as (

    select * from {{ ref('nsw_lga_code') }}

),

renamed as (
    select
        lga_code as lga_code,
        lga_name as lga_name
    from source
)

select * from renamed