-- Fails if any order was purchased in the future — a sign of a data
-- pipeline bug or bad timestamp parsing upstream.
select
    order_id,
    order_purchase_ts
from {{ ref('stg_orders') }}
where order_purchase_ts > current_timestamp
