/*

https://platform.stratascratch.com/coding/10313-naive-forecasting?code_type=1
https://stackoverflow.com/questions/19615187/get-timestamp-of-one-month-ago-in-postgresql
https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-to_date/
https://www.postgresql.org/docs/7.4/functions-math.html
https://www.postgresql.org/docs/current/functions-formatting.html


*/

select sqrt(SUM(error)) as MSE from 
    (select request_date, pow(distance_to_travel/monetary_cost-avg_coeff, 2) as error from uber_request_logs join 
        (select 
            to_date(to_char(request_date::timestamp, 'YYYY-MM'), 'YYYY-MM') as curr_month, 
            AVG(distance_to_travel/monetary_cost) as avg_coeff
        from uber_request_logs group by curr_month ) tmp /* avg on months */
    on to_date(
        to_char(
            uber_request_logs.request_date::timestamp - '1 month'::interval,
        'YYYY-MM'), 
       'YYYY-MM') = tmp.curr_month /* take average from last month on join */
    ) mse
