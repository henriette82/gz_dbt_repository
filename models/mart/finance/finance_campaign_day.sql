with joined AS (
 SELECT
     f.date_date AS date
     , f.revenue
     , f.margin
     , f.operational_margin
     , f.purchase_cost
     , f.shipping_fee
     , f.log_cost
     , f.ship_cost
     , f.quantity
     , f.average_basket
     , c.count_campaign_key
     , c.ads_cost
     , c.ads_impression
     , c.ads_click
     , (f.operational_margin - c.ads_cost) AS ads_margin
 FROM {{ref("int_campaigns_day")}} c
 LEFT JOIN {{ref("finance_days")}} f
 USING (date_date)
) 
select*
from joined

    