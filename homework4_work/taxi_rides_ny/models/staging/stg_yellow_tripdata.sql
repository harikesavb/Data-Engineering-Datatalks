select 
  -- identifiers
  cast(vendorid as INT) as vendor_id,
  cast(ratecodeid as INT) as rate_code_id,
  cast(pulocationid as INT) as pickup_location_id,
  cast(dolocationid as INT) as dropoff_location_id,

  -- timestamps
  cast(tpep_pickup_datetime as TIMESTAMP) as pickup_datetime,
  cast(tpep_dropoff_datetime as TIMESTAMP) as dropoff_datetime,

  --trip info
  store_and_fwd_flag,
  cast(passenger_count as INT) as passenger_count,
  cast(trip_distance as NUMERIC) as trip_distance,
  1 as trip_type,

  -- payment info
  cast(fare_amount as NUMERIC) as fare_amount,
  cast(extra as NUMERIC) as extra,
  cast(mta_tax as NUMERIC) as mta_tax,
  cast(tip_amount as NUMERIC) as tip_amount,
  cast(tolls_amount as NUMERIC) as tolls_amount,
  cast(0 as NUMERIC) as ehail_fee,
  cast(improvement_surcharge as NUMERIC) as improvement_surcharge,
  cast(total_amount as NUMERIC) as total_amount,
  cast(payment_type as INT) as payment_type,
  cast(congestion_surcharge as NUMERIC) as congestion_surcharge
  
from {{source('raw_data', 'yellow_tripdata')}}
WHERE vendorid is NOT NULL
