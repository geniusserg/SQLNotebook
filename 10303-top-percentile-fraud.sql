/*
https://platform.stratascratch.com/coding/10303-top-percentile-fraud?code_type=1
https://www.sqlshack.com/calculate-sql-percentile-using-the-sql-server-percent_rank-function/
*/

select policy_num,	state,	claim_cost,	fraud_score from 
(select *, percent_rank() over(partition by state order by fraud_score) as rankpct from fraud_score) tmp
where rankpct >= 0.95 order by state asc, rankpct desc
