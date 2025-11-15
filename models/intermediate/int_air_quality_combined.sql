with egypt as (
    select
        "CITY",
        "LATITUDE",
        "LONGITUDE",
        "PARAMETER",
        "VALUE",
        "DATE_UTC",
        'n/a' as "UNIT"
    from {{ ref('stg_egypt_air_quality') }}
),

nasa as (
    select
        null as "CITY",
        "LAT" as "LATITUDE",
        "LON" as "LONGITUDE",
        'AOD' as "PARAMETER",
        "AOD" as "VALUE",
        "TIMESTAMP" as "DATE_UTC",
        'n/a' as "UNIT"
    from {{ ref('stg_nasa_air_quality') }}
),

combined as (
    select * from egypt
    union all
    select * from nasa
)

select *
from combined
