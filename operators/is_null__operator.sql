-- 		The IS NULL Operator
/*

select 
	first_name,
    last_name,
    phone_number
from
	customers
where
-- 	phone_number is null;
	phone_number is not null;
    
*/

-- Exercise 

-- select the customers that are not shipped

select 
	*
from
	orders
where 
	shipped_date is null or 
        shipper_id is null;