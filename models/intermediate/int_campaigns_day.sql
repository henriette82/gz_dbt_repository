WITH ads_per_day AS (
    
   select
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click 
from {{ ref('int_campaigns') }}

),
agg AS (
    select
     date_date,
     COUNT(distinct campaign_key) AS count_campaign_key,
     SUM(ads_cost) AS ads_cost,
     SUM(impression) AS ads_impression,
     SUM(click) AS ads_click
from ads_per_day
GROUP BY date_date
)
select*
from agg
ORDER BY date_date DESC
