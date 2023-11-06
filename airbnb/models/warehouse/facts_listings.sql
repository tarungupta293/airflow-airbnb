{{
    config(
        unique_key='listing_id'
    )
}}

CREATE TABLE public_warehouse.facts_listings AS
select 
    l.listing_id,
    l.date,
    l.listing_neighbourhood,
    (select lc.lga_code from {{ ref('stg_nsw_lga_code') }} lc where lc.lga_name = l.listing_neighbourhood) as listing_neighbourhood_lga_code,
    l.host_id,
    l.host_name,
    l.host_since,
    l.host_is_superhost,
    l.host_neighbourhood,
   	(select s.lga_name from {{ ref('stg_nsw_suburb') }} s where upper(s.suburb_name) = upper(l.host_neighbourhood)) as host_neighbourhood_lga_name,
   	(select lc.lga_code from {{ ref('stg_nsw_lga_code') }} lc where upper(lc.lga_name) = (select s.lga_name from {{ ref('stg_nsw_suburb') }} s where upper(s.suburb_name) = upper(l.host_neighbourhood))) as host_neighbourhood_lga_code,
    l.property_type,
    l.room_type,
    l.price,
    l.accommodates,
    l.has_availability,
    l.availability_30,
    l.number_of_reviews,
    l.review_scores_rating
from 
{{ ref('stg_listings') }} l