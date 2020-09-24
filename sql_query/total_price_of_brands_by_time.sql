--What is the total price of brands by time?  
SELECT brand, 
       dateadded, 
       dateupdated, 
       Sum(prices_amountmax) 
FROM   ws_main 
GROUP  BY 1, 
          2, 
          3 
ORDER  BY 4 DESC, 
          1; 