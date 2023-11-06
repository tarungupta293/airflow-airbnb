select 
	host_neighbourhood_lga_name,
	TO_CHAR(TO_TIMESTAMP(date , 'YYYY-MM-DD'), 'MM/YYYY') as month_year,
	count(distinct(host_id)) as distinct_hosts,
	sum((case when has_availability = true then (30 - availability_30) end) * price) as total_estimated_revenue,
	sum((case when has_availability = true then (30 - availability_30) end) * price)/count(distinct(host_id)) as estimated_revenue_per_host
from public_warehouse.facts_listings fl
group by host_neighbourhood_lga_name , TO_CHAR(TO_TIMESTAMP(date , 'YYYY-MM-DD'), 'MM/YYYY')