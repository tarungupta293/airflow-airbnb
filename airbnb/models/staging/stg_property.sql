{{
    config(
        unique_key='listing_id'
    )
}}

with

source as (

    select * from {{ ref('snapshot_property') }}

),

renamed as (
    SELECT
        l.listing_id,
        l.scraped_date,
        property_type as property_type,
        number_of_reviews as number_of_reviews,
        CASE WHEN l.review_scores_rating = 'NaN' THEN 0 ELSE l.review_scores_rating END AS review_scores_rating,
        case when review_scores_accuracy = 'NaN' then 0 else l.review_scores_accuracy end as review_scores_accuracy,
        case when review_scores_cleanliness = 'NaN' then 0 else l.review_scores_cleanliness end as review_scores_cleanliness,
        case when review_scores_checkin = 'NaN' then 0 else l.review_scores_checkin end as review_scores_checkin,
        case when review_scores_communication = 'NaN' then 0 else l.review_scores_communication end as review_scores_communication,
        case when review_scores_value = 'NaN' then 0 else l.review_scores_value end as review_scores_value,
        dbt_valid_from as dbt_valid_from,
        dbt_valid_to as dbt_valid_to
    FROM
        source l
)

select * from renamed