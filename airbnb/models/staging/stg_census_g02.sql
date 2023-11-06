{{
    config(
        unique_key='lga_code_2016'
    )
}}

with

source as (

    select * from {{ ref('census_g02') }}

),

renamed as (
    select
        lga_code_2016 as lga_code_2016,
        median_age_persons as median_age_persons, 
        median_mortgage_repay_monthly as median_mortgage_repay_monthly,
        median_tot_prsnl_inc_weekly as median_tot_prsnl_inc_weekly,
        median_rent_weekly as median_rent_weekly,
        median_tot_fam_inc_weekly as median_tot_fam_inc_weekly,
        average_num_psns_per_bedroom as average_num_psns_per_bedroom,
        median_tot_hhd_inc_weekly as median_tot_hhd_inc_weekly,
        average_household_size as average_household_size
    from source
)

select * from renamed