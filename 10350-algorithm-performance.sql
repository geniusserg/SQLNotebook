/*
https://platform.stratascratch.com/coding/10350-algorithm-performance?code_type=1
*/


select search_id, MAX(search_rank) from
    (select search_id, search_term, clicked, search_results_position, (case when (clicked=1 and search_results_position<=3) then 3
    when (clicked=1 and search_results_position>3) then 2
    else 1
    end) as search_rank
    from fb_search_events) table_rank
group by search_id order by search_id

