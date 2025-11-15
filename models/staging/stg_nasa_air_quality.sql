with raw as (
    select *
    from {{ source('air_quality_source', 'AIR_QUALITY_NASA') }}
),

clean as (
    select
        LATITUDE as lat,
        LONGITUDE as lon,
        AOD_55 as aod,
        to_timestamp(DATE) as timestamp
    from raw
)

select * from clean
