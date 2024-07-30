-- The USING Clause

-- use sql_store;

/*

-- without USING clause
select
	o.order_id,
    c.first_name,
    c.last_name
from 
	orders as o
join
	customers as c
    on
		o.customer_id = c.customer_id;

*/

/*        
-- with USING clause
select
	o.order_id,
    c.first_name,
    c.last_name,
    s.shipper_name,
    os.status_name
from
	orders as o
join
	customers as c
    using (customer_id)
left outer join 
	shippers as s
    using (shipper_id)
left outer join
	order_statuses os
	on 
		o.order_status = os.order_status_id
order by
	s.shipper_name;


-- The USING clause in SQL is used to simplify the JOIN operations 
-- when two tables have one or more columns with the same name that 
-- are being used as the basis for the join. It is a part of the JOIN 
-- syntax and can be used with different types of joins, 
-- such as 
-- 		INNER JOIN, 
--  	LEFT JOIN, 
--  	RIGHT JOIN, 
-- 		etc.

*/


/*

-- without USING clause; joining tables with composite primary key
select
	*
from
	order_items as oi
left outer join
	order_item_notes as oin
    on
		oi.order_id = oin.order_id 
	and
		oi.product_id = oin.product_id;
        
        
-- with USING clause; joining tables with composite primary key
select
	*
from
	order_items as oi
left outer join
	order_item_notes as oin
	using (order_id, product_id);
	
*/

-- exercise --


use sql_invoicing;

select
	p.date,
    cl.first_name as 'client',
    p.amount,
    pm.payment_method_name as 'payment name'
from
	payments as p
left outer join
	clients as cl
    using (client_id)
left outer join
	payment_methods as pm
    on 
		p.payment_method = pm.payment_method_id;
	
        
