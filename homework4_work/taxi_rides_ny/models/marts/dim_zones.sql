with zones as (
    select * from {{ ref('taxi_zone_lookup') }}
)

select
    cast(locationid as int) as location_id,
    borough,
    zone,
    service_zone
from zones
