use sql_store;

/*
-- Explicit Join syntax

select
	*
from 
	orders
join
	customers
    on
		orders.customer_id = customers.customer_id;

*/

-- Implicit join syntax

select
	*
from
	orders,
    customers
where											-- if you forget this condition
	orders.customer_id = customers.customer_id; -- you'll get cross join