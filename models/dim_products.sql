with raw as (
    select distinct
        product_name,
        category
    from {{ source('raw', 'raw_sales') }}
)
select
    row_number() over (order by product_name) as product_id,
    product_name,
    category
from raw