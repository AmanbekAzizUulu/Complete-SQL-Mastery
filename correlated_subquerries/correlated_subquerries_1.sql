use sql_invoicing;


-- select clients that have an invoice 

/*
-- method #1 
select
	*
from
	clients
where
	client_id in 
			(
				select
					distinct client_id
				from
					invoices
            )
;
*/

/*

-- method #2 
select 
	*
from
	clients as cl
where exists 
		(
			select
				distinct client_id
			from 
				invoices as inv
			where 
				client_id = cl.client_id
        )
;

*/
-- exercise
-- find the products that have never been ordered 

use sql_store;

select
	*
from
	products as p
where not exists 
	(
		select
			distinct product_id
		from 
			order_items as oi
		where 
			product_id = p.product_id
	)