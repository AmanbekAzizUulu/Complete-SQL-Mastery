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
			select					-- данный подзапрос вернет лишь 1 значение,
				max(invoice_total)  -- поэтому тут не нужно использовать ключевое 
			from					-- слово 'all'
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
			select				-- данный подзапрос вернет список значений
				invoice_total	-- поэтому нужно использовать ключевое слово 'all'
			from				-- invoice_total > value_1
				invoices 		-- 				 > value_2
			where				--   			 > value_3
				client_id = 3   --   			 ....
        )
;

