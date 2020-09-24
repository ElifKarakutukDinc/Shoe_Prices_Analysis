--Which ones have the widest distribution of prices?
SELECT brand, 
       Max(prices_amountmax)                     max_price, 
       Min(prices_amountmax)                     min_price, 
       Avg(prices_amountmax)                     avg_price, 
       SUM(prices_amountmax)                     total_price, 
       STDDEV(prices_amountmax)                  standard_deviation, 
       Percentile_disc(0.5) 
         within GROUP(ORDER BY prices_amountmax) median, 
       Percentile_disc(0.25) 
         within GROUP(ORDER BY prices_amountmax) median_25, 
       Percentile_disc(0.75) 
         within GROUP(ORDER BY prices_amountmax) median_75 
FROM   ws_main 
GROUP  BY 1 
ORDER  BY 2 DESC; 