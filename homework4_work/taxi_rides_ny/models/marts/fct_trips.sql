with trips as (
    select * from {{ ref('int_trips') }}
),

zones as (
    select * from {{ ref('dim_zones') }}
),

trips_enriched as (
    select
        t.trip_id,
        t.vendor_id,
        t.service_type,
        t.rate_code_id,
        t.payment_type,
        t.payment_type_description,
        t.pickup_datetime,
        t.dropoff_datetime,
        {{ get_trip_duration_minutes('t.pickup_datetime', 't.dropoff_datetime') }} as trip_duration_minutes,
        t.pickup_location_id,
        pz.zone as pickup_zone,
        pz.borough as pickup_borough,
        pz.service_zone as pickup_service_zone,
        t.dropoff_location_id,
        dz.zone as dropoff_zone,
        dz.borough as dropoff_borough,
        dz.service_zone as dropoff_service_zone,
        t.store_and_fwd_flag,
        t.passenger_count,
        t.trip_distance,
        t.trip_type,
        t.fare_amount,
        t.extra,
        t.mta_tax,
        t.tip_amount,
        t.tolls_amount,
        t.ehail_fee,
        t.improvement_surcharge,
        t.total_amount
    from trips t
    left join zones pz
        on t.pickup_location_id = pz.location_id
    left join zones dz
        on t.dropoff_location_id = dz.location_id
)

select * from trips_enriched
