--Which brands have the highest prices? 
SELECT brand, 
       Max(prices_amountmax) 
FROM   ws_main 
GROUP  BY 1 
ORDER  BY 2 DESC; 