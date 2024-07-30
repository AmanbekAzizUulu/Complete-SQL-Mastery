use sql_store;
/*
select 
	*
from
	customers as c
join
	orders as o
    on
		c.customer_id = o.customer_id
        
order by
	o.order_id;
*/

/*

select 
	c.customer_id,
    c.first_name,
    c.last_name,
    
    o.order_id
from
	customers as c
join
	orders as o
    on	-- left			  right
		c.customer_id = o.customer_id
order by
	c.first_name;
    
-- the problem with this query is that we 
-- are selecting only those customers who have made purchases
-- cutomers with id 2, 5, 6, 7, 8, 10

-- To select all customers, regardless of whether they have made a purchase or not, 
-- we need to use a query with an outer join

*/


/*
-- Left join
select 
	c.customer_id,
	o.order_id,
	
    c.first_name,
    c.last_name
   
from 
	customers as c
left outer join
	orders as o
    on	-- left			  right
		c.customer_id = o.customer_id
order by
	o.order_id;
    
-- сustomers with a NULL value in the order_id 
-- column have not made any purchases yet


*/

/*
-- Right join

select 
	c.customer_id,
	o.order_id,
	
    c.first_name,
    c.last_name
   
from 
	customers as c
right outer join
	orders as o
    on	-- left			  right
		c.customer_id = o.customer_id
order by
	o.order_id;
    
-- the result of the selection using this method will be identical 
-- to the result of the selection using an inner join, because we 
-- returned all the values from the orders table

*/


-- Exercise

select
    products.product_name,
    products.product_id,
    order_items.quantity as been_ordered
from
	products
left outer join
	order_items
	on
		products.product_id = order_items.product_id
order by
	products.product_name;
	