--Is there any difference between products at the same brand by online or store selling? 
SELECT Lower(brand), 
       ean_upc, 
       CASE 
         WHEN prices_offer LIKE 'Online only%' THEN 'Online' 
         WHEN prices_offer NOT LIKE 'Online only%' THEN 'Store' 
         WHEN prices_offer LIKE '%In Store' THEN 'Store' 
       END shop_type, 
       Count(*) 
FROM   ws_main 
GROUP  BY 1, 
          2, 
          3 
ORDER  BY 1,
		  4 DESC; 