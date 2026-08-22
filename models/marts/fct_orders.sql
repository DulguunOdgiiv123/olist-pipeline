select
    o.order_id,
    o.order_status,
    o.order_purchase_ts,
    o.order_delivered_ts,
    o.order_estimated_delivery_ts,
    c.customer_id,
    c.customer_city,
    c.customer_state,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) as item_total
from {{ ref('stg_orders') }} as o
left join {{ ref('stg_customers') }} as c
    on o.customer_id = c.customer_id
left join {{ ref('stg_order_items') }} as oi
    on o.order_id = oi.order_id
