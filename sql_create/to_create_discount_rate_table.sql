--to create discount_rate table
SELECT   Lower(brand) brand, 
         Substring(Split_part(prices_offer, ' ', Cast( 
                                                       ( 
                                                       SELECT Count(1) 
                                                       FROM   Regexp_matches( prices_offer , ' ', 'g' )) AS INTEGER)), 1, Length( Split_part(prices_offer, ' ', 3)) - 1) discount_rate
INTO     public.discount_rate 
FROM     ws_main 
WHERE    Length(Split_part(prices_offer, ' ', Cast( 
                                                    ( 
                                                    SELECT Count(1) 
                                                    FROM   Regexp_matches(prices_offer, ' ', 'g' )) AS INTEGER))) > 0
AND      prices_offer LIKE '%off%' 
GROUP BY 1, 
         2;