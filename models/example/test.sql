select *
from {{ source('air_quality_source', 'AIR_QUALITY_NASA') }}
limit 10
