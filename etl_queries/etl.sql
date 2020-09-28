---With Drop/Create ETL:
--Firstly I created new 10 rows for example purposes. 
select *
into ws_main_staging
from ws_main
limit 10;

--Upsert
delete from ws_main w
using  ws_main_staging m
where w.id = m.id;

insert into  ws_main
select *
from ws_main_staging; 

--to create discount_rate table 
DROP table IF EXISTS PUBLIC.discount_table;
SELECT   Lower(brand) brand,
         Substring(Split_part(prices_offer, ' ', Cast( 
                                                        ( 
                                                        SELECT Count(1) 
                                                        FROM   Regexp_matches( prices_offer , ' ', 'g' )) AS INTEGER)), 1, Length( Split_part(prices_offer, ' ', 3)) - 1) discount_rate
INTO     PUBLIC.discount_rate 
FROM     ws_main 
WHERE    Length(Split_part(prices_offer, ' ', Cast( 
                                                     ( 
                                                     SELECT Count(1) 
                                                     FROM   Regexp_matches(prices_offer, ' ', 'g' )) AS INTEGER))) > 0
AND      prices_offer LIKE '%off%' 
GROUP BY 1, 
         2; 

--to create brand_price_descriptives table
DROP table IF EXISTS brand_price_descriptives;
SELECT   brand,
         Max(prices_amountmax)                                         max_price, 
         Min(prices_amountmax)                                         min_price, 
         Avg(prices_amountmax)                                         avg_price, 
         Sum(prices_amountmax)                                         total_price, 
         Stddev(prices_amountmax)                                      standard_deviation, 
         Percentile_disc(0.5) within GROUP(ORDER BY prices_amountmax)  median, 
         percentile_disc(0.25) within GROUP(ORDER BY prices_amountmax) median_25, 
         percentile_disc(0.75) within GROUP(ORDER BY prices_amountmax) median_75 
INTO     brand_price_descriptives 
FROM     ws_main 
GROUP BY 1;

--I used drop/create way. Because brand_price_descriptives and discount_rate tables don't have primary key for maching with ws_main. 