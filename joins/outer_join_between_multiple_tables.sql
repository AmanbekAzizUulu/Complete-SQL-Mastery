-- Outer Join Between Multiple Tables

use sql_store;
/*

select 
	c.customer_id,
    o.order_id,
    c.first_name,
    c.last_name,
    s.shipper_name
from
	customers as c
left outer join							-- first outer join
	orders as o
    on 
		c.customer_id = o.customer_id
left outer join							-- second outer join								
	shippers as s
    on
		o.shipper_id = s.shipper_id

order by
	o.customer_id;
    
-- it is recommended to use only one type of outer join in a single query, 
-- either `LEFT OUTER JOIN` or `RIGHT OUTER JOIN`, 
-- as this simplifies the readability of the code

*/

-- Exercise --

select
	o.order_id,
    o.order_date,
    c.first_name,
    s.shipper_name,
    os.status_name
from
	orders as o
left outer join
	customers as c
    on
		o.customer_id = c.customer_id
left outer join
	shippers as s
	on
		o.shipper_id = s.shipper_id
left outer join
	order_statuses as os
    on 
		o.order_status = os.order_status_id
order by
	s.shipper_name;
		
