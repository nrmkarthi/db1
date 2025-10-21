select
    s.order_id,
    c.customer_id,
    p.product_id,
    d.date_id,
    s.quantity,
    s.price,
    s.quantity * s.price as total_amount
from {{ source('raw', 'raw_sales') }} s
join {{ ref('dim_customers') }} c
    on s.customer_email = c.customer_email
join {{ ref('dim_products') }} p
    on s.product_name = p.product_name
join {{ ref('dim_date') }} d
    on s.order_date = d.order_date