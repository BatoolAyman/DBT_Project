select distinct
    city,
    latitude,
    longitude
from {{ ref('int_air_quality_combined') }}
where latitude is not null
