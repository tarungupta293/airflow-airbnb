with

source as (

    select * from {{ ref('nsw_suburb') }}

),

renamed as (
    select
        lga_name as lga_name,
        suburb_name as suburb_name
    from source
)

select * from renamed