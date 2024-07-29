-- The ORDER BY Clause (read desc)

/*
select
	*
from
	customers
order by 
-- 	customer_id;
-- 	first_name asc;
--  first_name desc;
-- 	last_name asc; 
-- 	last_name desc;
	state desc, first_name asc;
*/

-- *** Explanation *** --

-- In SQL, you can sort by two or more columns using the 'ORDER BY' clause, 
-- specifying the columns separated by commas. The sorting will be done first
-- by the first column specified, and if the values in this column are the same, 
-- then by the next column, and so on.

-- Example query:
/*

SELECT *
FROM employees
ORDER BY department_id, salary DESC;

*/
-- In this query, the data will first be sorted by the 'department_id' column, 
-- and then, within each group of the same 'department_id' values, by the 'salary' 
-- column in descending order.

-- Exercise  

select 
	*,
    unit_price * quantity as total_price
from 
	order_items
where 
	order_id = 2
order by 
	total_price desc;