--What is the average price of each distinct brand listed? 
SELECT distinct brand, 
       ( prices_amountmax + prices_amountmin ) / 2 avg_price
FROM   ws_main 
GROUP  BY 1, 
          2 
ORDER  BY 2 DESC; 