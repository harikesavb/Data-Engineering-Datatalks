with trips_unioned as (
    select * from {{ref('int_trips_unioned')}}
),

 vendors as (
    SELECT
    DISTINCT vendor_id,
    {{get_vendor_names('vendor_id')}} as vendor_name
    from trips_unioned
 )
 SELECT * from vendors
 