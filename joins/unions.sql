--  Unions

use sql_store;

/*
-- union operator using with 1 table selection

select
	order_id,
    order_date,
    'active' as status
from 
	orders as o
where 
	order_date >= '2019-01-01'
union

select
	order_id,
    order_date,
    'archived' as status
from
	orders as o
where 
	order_date < '2019-01-01';
    
*/

/*


-- union operator using with 2 different table selections
-- generating 2 columns 

select
	first_name,
    '-' as shipper_name
from
	customers as c
union 

select
	'-' as first_name,
	shipper_name
from
	shippers as sh;
 
 
-- generating 1 column 

select
	first_name as full_name
from
	customers
union

select
	shipper_name
from
	shippers;

 */
 
-- UNION combines the results of these queries, excluding duplicate rows.
-- UNION ALL combines the results of these queries, including all duplicate rows.
 
 
-- exercise
 
select 
	customer_id,
    first_name,
    points,
	'bronze' as type_of_account
from
	customers
where
	points < 2000
union all

select 
	customer_id,
    first_name,
    points,
    'silver' as type_of_account
from 
	customers
where 
	points between 2000 and 3000
union all

select
	customer_id,
    first_name,
    points,
    'gold' as type_of_account
from
	customers
where 
	points > 3000
order by
	first_name;