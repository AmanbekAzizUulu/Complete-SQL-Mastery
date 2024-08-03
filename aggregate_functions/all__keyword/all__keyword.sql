-- The ALL keyword

use sql_invoicing;


-- select invoice larger than all invoices of client with ID = 3
/*
-- without usage of ALL keyword
select
	*
from
	invoices
where
	invoice_total > 
		(
			select
				max(invoice_total)
			from
				invoices 
			where 
				client_id = 3
        )
;

*/

-- using ALL keyword

select
	*
from
	invoices 
where
	invoice_total > all
		(
			select
				invoice_total
			from
				invoices 
			where
				client_id = 3
        )
;

