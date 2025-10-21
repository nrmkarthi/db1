with raw as (
    select distinct
        order_date
    from {{ source('raw', 'raw_sales') }}
)
select
    row_number() over (order by order_date) as date_id,
    order_date,
    year(order_date) as year,
    month(order_date) as month,
    day(order_date) as day
from raw