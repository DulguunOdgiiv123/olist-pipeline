-- Fails if any order item has a negative or zero price — a real data bug,
-- not just a missing/duplicate value.
select
    order_id,
    order_item_id,
    price
from {{ ref('stg_order_items') }}
where price <= 0
