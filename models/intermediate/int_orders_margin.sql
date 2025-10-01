with

    sales as (

        select date_date, orders_id, pdt_id as products_id, quantity, revenue
        from {{ source("raw", "sales") }}

    ),

    product as (

        select products_id, 
        safe_cast(purchse_price as int64) as purchase_price
        from {{ source("raw", "product") }}

    )
select
    s.date_date,
    s.orders_id,
    s.quantity,
    s.revenue,
    (s.quantity * p.purchase_price) as purchase_cost,
    (s.revenue - (s.quantity * p.purchase_price)) as margin
from sales s
left join product p using (products_id)
