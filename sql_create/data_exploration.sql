--data exploration 
--To check all columns for to look no data columns
select count(*)
from ws_main 
where length (id) = 0;
/*No data count of "asins" is 9995, "dimension" is 9535, "imageurls" is 7357, "manufacturer" is 8638, "manufacturernumber" is 8569, "prices_condition" is 10000, "prices_dateadded" is 10000,
"prices_issale" is 8636, "prices_merchant" is 10000, "prices_returnpolicy" is 10000, "prices_shipping" is 9951*/

--to check differences
select distinct prices_amountmax- prices_amountmin 
from ws_main;
--result is 0. there is no differenses in two columns. 

--to check differences between dateadded and dateupdated. 
select EXTRACT(DAY FROM (dateupdated)-(dateadded)) AS DateDifference
from ws_main;



