SELECT
  *
FROM {{ source('raw', 'census_2016_g02') }}