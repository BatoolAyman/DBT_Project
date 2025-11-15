with raw as (
    select *
    from {{ source('air_quality_source', 'AIR_QUALITY') }}
),

unpivoted as (
    select
        city,
        latitude,
        longitude,
        date as date_utc,
        col as parameter,
        value
    from raw
    unpivot (
        value for col in (CO, NO, NO2, O3, SO2, PM2_5, PM10, NH3)
    )
)

select *
from unpivoted
