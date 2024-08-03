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
				distinct customer_id
			from
				orders
			where
				order_id in
					(
						select
							order_id
						from 
							order_items
						where
							product_id = 3
                    )
        )
;

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
      