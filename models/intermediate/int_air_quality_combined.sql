with egypt_raw as (
    select *
    from AIR_QUALITY_DB.EGYPT_DATA_STAGING.STG_EGYPT_AIR_QUALITY
),

egypt as (
    select
        city,
        latitude,
        longitude,
        date as date_utc,
        col as parameter,
        value
    from egypt_raw
    unpivot (
        value for col in (CO, NO, NO2, O3, SO2, PM2_5, PM10, NH3)
    )
),

nasa as (
    select
        null as city,
        lat as latitude,
        lon as longitude,
        'AOD' as parameter,
        aod as value,
        timestamp as date_utc
    from AIR_QUALITY_DB.EGYPT_DATA_STAGING.STG_NASA_AIR_QUALITY
),

combined as (
    select city, latitude, longitude, parameter, value, date_utc, 'n/a' as unit from egypt
    union all
    select city, latitude, longitude, parameter, value, date_utc, 'n/a' as unit from nasa
)

select *
from combined
