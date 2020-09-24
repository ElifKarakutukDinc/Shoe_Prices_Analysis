--Which brands sell their shoes online or in stores? 
select Lower(brand),
CASE 
      WHEN prices_offer like 'Online only%' then 'Online'
      WHEN prices_offer not like 'Online only%' then 'Store'
      WHEN prices_offer like '%In Store' then 'Store'
      end shop_type, count(*)
from ws_main
group by 1, 2
order by 3 desc; 