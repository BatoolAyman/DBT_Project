with egypt_raw as (
    select *
    from AIR_QUALITY_DB.EGYPT_DATA_STAGING.STG_EGYPT_AIR_QUALITY
),

egypt as (
    select
        CITY,
        LATITUDE,
        LONGITUDE,
        DATE as DATE_UTC,
        col as PARAMETER,
        VALUE
    from egypt_raw
    unpivot (
        VALUE for col in (CO, NO, NO2, O3, SO2, PM2_5, PM10, NH3)
    )
),

nasa as (
    select
        null as CITY,
        lat as LATITUDE,
        lon as LONGITUDE,
        'AOD' as PARAMETER,
        aod as VALUE,
        timestamp as DATE_UTC
    from AIR_QUALITY_DB.EGYPT_DATA_STAGING.STG_NASA_AIR_QUALITY
),


combined as (
    select CITY, LATITUDE, LONGITUDE, PARAMETER, VALUE, DATE_UTC, 'n/a' as UNIT from egypt
    union all
    select CITY, LATITUDE, LONGITUDE, PARAMETER, VALUE, DATE_UTC, 'n/a' as UNIT from nasa
)

select *
from combined
