-- The Inner Joins
/*
select 
	order_id,
    customers.customer_id as customer_id_from_customers_tb,	-- just 'customer_id' is an error
    orders.customer_id as customer_id_from_orders_tb, 	-- just 'customer_id' is an error
    first_name,
    last_name
from 
	orders
inner join
	customers 
    on
		orders.customer_id = customers.customer_id
order by
	first_name;



-- using alies for table names
select 
	order_id,
    c.customer_id as customer_id_from_customers_tb,	-- just 'customer_id' is an error
    o.customer_id as customer_id_from_orders_tb, 	-- just 'customer_id' is an error
    first_name,
    last_name
from 
	orders o		-- alies for 'orders' table
inner join
	customers c		-- alies for 'customer' table
    on
		o.customer_id = c.customer_id
order by
	first_name;

*/

select 
	o_ii.order_id,
	pp.product_name,
    o_ii.quantity,
    o_ii.unit_price,
    o_ii.unit_price * o_ii.quantity as total_price
from 
	products as pp					-- alies
inner join
	order_items as o_ii				-- alies
	on	
		pp.product_id = o_ii.product_id
order by 
	o_ii.order_id;
	