-- Subqueries

/*use sql_store;


select
	*
from
	products
where unit_price > 
	(
		select
			unit_price
		from
			products
		where 
			product_id = 3
    )  -- данный подзапрос вернет unit_price продукта который имеет product_id = 3
;	   -- таким образом получится что 
       -- 								where unit_price > price of product with ID = 3

*/

-- exercise 
use sql_hr;

select
	*
from
	employees
where
	salary > (
		select
			avg(salary)
		from
			employees
    )
;
