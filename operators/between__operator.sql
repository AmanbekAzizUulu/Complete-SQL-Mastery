
-- The BETWEEN Operator
use sql_store;

/*
-- without BETWEEN operator

select 
	*
from 
	customers
where 
	points >= 1000 and
    points <= 3000;
    
-- using the BETWEEN operator
*/

select 
	*
from 
	customers
where 
	points between 1000 and 
				   3000;

-- example --
select 
	*
from
	customers 
where 
	birth_date between '1990-01-01' and 
					   '2000-01-01';
                       
