-- Updating Multiple Rows

use sql_invoicing;
/*
update
	invoices
set 
	payment_total = invoice_total * 0.7,
    payment_date = due_date
where 
	client_id = 3;
*/

/*
update
	invoices
set
	payment_total = invoice_total * 0.3,
    payment_date = '2018-02-01'
where
	client_id in (4, 5);
*/

/**/

-- exercise

use sql_store;

update
	customers
set
	points = points + 50
where
	birth_date < '1990-01-01';
	
	
