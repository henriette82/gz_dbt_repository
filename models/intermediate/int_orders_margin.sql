with 

sales as (

    select 
       date_date,
       orders_id,
       pdt_id AS products_id,
       quantity,
       revenue
    from {{ source('raw', 'sales') }} 

),

product as (

    select
        products_id,
        SAFE_CAST(purchSE_PRICE AS INT64) AS purchase_price
    from {{ source('raw', 'product') }} 

)
select
     s.date_date,
     s.orders_id,
     s.quantity,
     s.revenue,
     (s.quantity * p.purchase_price) AS purchase_cost,
     (s.revenue - (s.quantity * p.purchase_price)) AS margin
from sales s      
left join product p using (products_id)

