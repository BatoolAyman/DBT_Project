select distinct
    date_utc,
    year(date_utc) as year,
    month(date_utc) as month,
    day(date_utc) as day
from {{ ref('int_air_quality_combined') }}
where date_utc is not null
