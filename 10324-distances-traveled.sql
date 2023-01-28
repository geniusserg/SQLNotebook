/*
https://platform.stratascratch.com/coding/10324-distances-traveled?code_type=1
*/

select user_id, lyft_users.name, sum_distance from
(select user_id, SUM(distance) sum_distance from lyft_rides_log group by user_id) tmp
join lyft_users on tmp.user_id=lyft_users.id order by sum_distance desc limit 10
