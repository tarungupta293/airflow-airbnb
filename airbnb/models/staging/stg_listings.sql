{{
    config(
        unique_key='listing_id'
    )
}}

with

source as (

    select * from {{ ref('listings') }}

),

renamed as (
    SELECT
        l.listing_id,
        l.scrape_id,
        l.scraped_date as date,
        l.host_id,
        case when host_name = 'NaN' then 'Unknown' else host_name end as host_name,
        case when host_since = 'NaN' then '2016-01-01' else host_since end as host_since,
        case when host_is_superhost = 'NaN' then 't' else host_is_superhost end as host_is_superhost,
        case when host_neighbourhood = 'NaN' then 'Sydney' else host_neighbourhood end as host_neighbourhood,
        listing_neighbourhood as listing_neighbourhood,
        property_type as property_type,
        room_type as room_type,
        accommodates as accommodates,
        price as price,
        has_availability as has_availability,
        availability_30 as availability_30,
        number_of_reviews as number_of_reviews,
        CASE WHEN l.review_scores_rating = 'NaN' THEN 0 ELSE l.review_scores_rating END AS review_scores_rating
    FROM
        source l
)

select * from renamed