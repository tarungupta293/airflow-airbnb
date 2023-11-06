{{
    config(
        unique_key='lga_code_2016'
    )
}}

select * from {{ ref('stg_census_g02') }}