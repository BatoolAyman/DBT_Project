select distinct
    parameter as pollutant_name,
    unit
from {{ ref('int_air_quality_combined') }}
