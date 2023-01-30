/*
https://platform.stratascratch.com/coding/10315-cities-with-the-most-expensive-homes?tabname=question
https://github.com/wtlow003/stratascratch-daily/blob/main/sql/10315.sql
*/

select city 
from zillow_transactions
group by city
having avg(mkt_price) > (
    select avg(mkt_price)
    from zillow_transactions
)
order by avg(mkt_price) desc
