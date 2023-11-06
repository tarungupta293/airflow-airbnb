{{
    config(
        unique_key='lga_code_2016'
    )
}}

with

source  as (

    select * from {{ ref('census_g01') }}

),

renamed as (
    select
        lga_code_2016 as lga_code_2016,
        tot_p_m as tot_p_m,
        tot_p_f as tot_p_f,
        tot_p_p as tot_p_p,
        age_0_4_yr_m as age_0_4_yr_m,
        age_0_4_yr_f as age_0_4_yr_f,
        age_0_4_yr_p as age_0_4_yr_p,
        age_5_14_yr_m as age_5_14_yr_m,
        age_5_14_yr_f as age_5_14_yr_f,
        age_5_14_yr_p as age_5_14_yr_p,
        age_15_19_yr_m as age_15_19_yr_m, 
        age_15_19_yr_f as age_15_19_yr_f,
        age_15_19_yr_p as age_15_19_yr_p,
        age_20_24_yr_m as age_20_24_yr_m,
        age_20_24_yr_f as age_20_24_yr_f,
        age_20_24_yr_p as age_20_24_yr_p,
        age_25_34_yr_m as age_25_34_yr_m,
        age_25_34_yr_f as age_25_34_yr_f,
        age_25_34_yr_p as age_25_34_yr_p,
        age_35_44_yr_m as age_35_44_yr_m,
        age_35_44_yr_f as age_35_44_yr_f,
        age_35_44_yr_p as age_35_44_yr_p,
        age_45_54_yr_m as age_45_54_yr_m,
        age_45_54_yr_f as age_45_54_yr_f,
        age_45_54_yr_p as age_45_54_yr_p,
        age_55_64_yr_m as age_55_64_yr_m,
        age_55_64_yr_f as age_55_64_yr_f,
        age_55_64_yr_p as age_55_64_yr_p,
        age_65_74_yr_m as age_65_74_yr_m,
        age_65_74_yr_f as age_65_74_yr_f,
        age_65_74_yr_p as age_65_74_yr_p,
        age_75_84_yr_m as age_75_84_yr_m,
        age_75_84_yr_f as age_75_84_yr_f,
        age_75_84_yr_p as age_75_84_yr_p,
        age_85ov_m as age_85ov_m,
        age_85ov_f as age_85ov_f,
        age_85ov_p as age_85ov_p
    from source
)

select * from renamed