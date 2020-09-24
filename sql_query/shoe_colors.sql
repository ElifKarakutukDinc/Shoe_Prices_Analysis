/*Which colors are preferred by people?  
PS: I didn't prefere colors column because it shows all colors in some rows. But Prices_color shows real color of shoes.*/
SELECT Lower(prices_color), 
       Sum(prices_amountmax), 
       Count(*) 
FROM   ws_main 
GROUP  BY 1 
ORDER  BY 3 DESC, 
          1; 

SELECT Lower(prices_color) 
FROM   ws_main 
GROUP  BY 1 
HAVING Lower(prices_color) LIKE 'black%'; 