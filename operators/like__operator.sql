-- 		The LIKE Operator
/*
select 
	*
from
	customers
where
-- 	last_name like 'B%';
-- 	last_name like 'Brush%';
-- 	last_name like '%b%';
-- 	last_name like '_____y'; 
	last_name like 'b____y';

-- 	% - any number of characters
-- 	_ - a single character


--      EXERCISES

--      get the customers whose 
--     		addresses contain 'Trail' or 'Avenue'
-- 			phone number ends with 9



select
	*
from 
	customers
where 
	address like '%Trail%' or 
    address like '%Avenue%';

/*
select 
	*
from 
	customers
where 
--	phone_number like '___________9';
	phone_number like '%9';
*/