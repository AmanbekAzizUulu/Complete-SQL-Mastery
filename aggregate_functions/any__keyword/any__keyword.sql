-- The 'any' keyword

use sql_invoicing;

/*
-- select products that were sold by the unit (quantity = 1)
-- using 'any' keyword
select
	*
from
	invoices 
where 
	invoice_total > any -- some
		(
			select
				invoice_total
			from
				invoices 
			where
				client_id = 3
        )
;
*/

/*
-- select clients with at least two invoices

-- without 'any' keyword
select 								-- Select all columns from the 'clients' table
    * 
from 
    clients 
where 
    client_id in 					
        (							-- Filter the clients based on a subquery
            select 					-- Subquery: Select 'client_id' from the 'invoices' table
                client_id 
            from 
                invoices as inv 
            group by 				-- Group the results by 'client_id'
                client_id 
            having 					-- Only include groups having 2 or more invoices
                count(*) >= 2 
        );

*/
-- with 'any' keyword

select
	*
from
	clients
where
	client_id = any 
		(
			select
				client_id
			from
				invoices as inv
			group by
				client_id
			having
				count(*) >= 2
        )
;

	