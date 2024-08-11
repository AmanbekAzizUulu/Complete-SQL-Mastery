use sql_invoicing;

-- updateable view

create or replace
view invoices_with_balance_with_check_option as
	select
		invoice_id,
		invoice_number,
		client_id,
		invoice_total,
		payment_total,
		invoice_total - payment_total as balance,
		invoice_date,
		due_date,
		payment_date
	from
		invoices
	where 
		(invoice_total - payment_total) > 0
	with check option;
    
    