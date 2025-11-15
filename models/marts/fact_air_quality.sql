select
    date_utc,
    city,
    parameter,
    value,
    {{ air_quality_category('value') }} as quality_category
from {{ ref('int_air_quality_combined') }}
