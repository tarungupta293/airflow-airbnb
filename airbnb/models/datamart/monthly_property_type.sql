select 
	sl.property_type,
	sl.room_type,
	sl.accommodates,
	TO_CHAR(TO_TIMESTAMP(date , 'YYYY-MM-DD'), 'MM/YYYY') as month_year,
	(count(case when has_availability = true then 1 end) * 100) / count(*) as active_listings_rate,
	min(case when has_availability = true then price end) as min_price_active_listings,
	max(case when has_availability = true then price end) as max_price_active_listings,
	avg(case when has_availability = true then price end) as avg_price_active_listings,
	count(distinct(host_id)) as distinct_hosts,
	(count(case when host_is_superhost::boolean = true then 1 end) * 100) / count(distinct(host_id))  as superhost_rate,
	avg(case when has_availability = true then review_scores_rating end) as avg_review_score_rating,
	((count(case when has_availability = true then 1 end) - lag(count(case when has_availability = true then 1 end)) over (PARTITION BY property_type)) * 100)/lag(count(case when has_availability = true then 1 end)) over (PARTITION BY property_type) as active_listing_change,
	sum(case when has_availability = true then (30 - availability_30) end) as total_number_of_stays,
	avg((case when has_availability = true then (30 - availability_30) end) * price) as avg_estimated_revenue
from public_warehouse.facts_listings sl
group by property_type , room_type , accommodates , TO_CHAR(TO_TIMESTAMP(date , 'YYYY-MM-DD'), 'MM/YYYY')