/*
https://platform.stratascratch.com/coding/10318-new-products?code_type=1

*/

with tmp as 
    (select year,
            company_name, 
            COUNT(product_name) as count_product 
    from car_launches 
    group by year, company_name)
    
select tmp.company_name, 
       tmp.count_product-tmp_2020.count_product as diff 
    from tmp 
    join tmp as tmp_2020 
    on tmp.company_name = tmp_2020.company_name 
        and tmp.year = 2019 
        and tmp_2020.year = 2020
