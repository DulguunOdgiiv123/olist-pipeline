select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp::timestamp as order_purchase_ts,
    order_delivered_customer_date::timestamp as order_delivered_ts,
    order_estimated_delivery_date::timestamp as order_estimated_delivery_ts
from {{ source('olist_raw', 'orders') }}
