-- Subqueries vs Joins

/*
use sql_invoicing;


select
	*
from
	clients
where
	client_id not in 
		(
			select
				distinct client_id
			from
				invoices
        )
;   

*/     

/*
-- replacing usage of subquerries with usage of joins

select
	*
from
	clients as cl
left join
	invoices as inv
    on
		cl.client_id = inv.client_id
where
	inv.invoice_id is null;
        
*/


/*

So which approach should you use? Well that depends on a couple of things. One
is performance, and the other readability. Later in the course we talk about
execution plans. So you will learn how to write a query that gets executed
faster. But assuming that both these queries have the same
execution time, you should go for a query that is most readable.
In this particular example, the first query is more intuitive because
it better aligns with the problem you're trying to solve.

*/
-- exercise 

-- find customers who have ordered Letucce (product_id = 3)
-- 		select  customer_id
--  			first_name
-- 				last_name
        
use sql_store;

/*
-- querry # 1
					
select						-- Select customer details
    customer_id, 				-- Select the customer_id
    first_name,   				-- Select the first_name
    last_name     				-- Select the last_name
from
    customers     				-- From the customers table
where
    customer_id in  				-- Where customer_id is in the result set of the subquery
        (
            select				-- Subquery to find distinct customers who have orders with product_id = 3 
                distinct customer_id  		-- Select distinct customer_id
            from
                orders  			-- From the orders table
            where
                order_id in  			-- Where order_id is in the result set of the subquery
                    (		
                        select			-- Subquery to find order_ids that contain product_id = 3
                            order_id 		-- Select the order_id
                        from 
                            order_items  	-- From the order_items table
                        where
                            product_id = 3  	-- Where the product_id is 3
                    )
        )
;

-- Explanation:

-- The main query selects customer details (customer_id, first_name, last_name) from the customers table.
-- The `WHERE` clause filters these customers based on whether their customer_id is in the result set of a subquery.
-- The first subquery selects distinct customer_id from the orders table.
-- It uses a nested subquery to filter orders that contain product_id = 3.
-- The innermost subquery selects order_id from the order_items table where product_id is 3.
-- This structure ensures that only customers who have ordered product_id = 3 are selected in the main query.


*/

/*
-- querry # 2
select
	customer_id,
    	first_name,
    	last_name
from
	customers
where
	customer_id in
		(
			select
				customer_id
			from
				order_items as oi
			join
				orders as o
				using
					(order_id)
			where
				product_id = 3
        )

*/

-- querry # 3
  select
	distinct customer_id,
    	first_name,
    	last_name
from
	customers as c
left join
	orders as o
    using
		(customer_id)
left join
	order_items as oi
	using
		(order_id)
where
	oi.product_id = 3;
      
