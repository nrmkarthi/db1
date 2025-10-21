with raw as (
    select distinct
        customer_name,
        customer_email
    from {{ source('raw', 'raw_sales') }}
)
select
    row_number() over (order by customer_email) as customer_id,
    customer_name,
    customer_email
from raw