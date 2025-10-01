with source AS (
    select* from{{source("raw", "sales")}}
),
renamed as (
    SELECT
date_date,
orders_id,
pdt_id AS product_id,
revenue,
quantity
from source
)
SELECT * from renamed
