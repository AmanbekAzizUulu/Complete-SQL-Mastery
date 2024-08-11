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
    
    
-- in this view, the WITH CHECK OPTION ensures that any updates or inserts through 
-- this view will only allow invoices where the balance is greater than 0 
-- (i.e., where (invoice_total - payment_total) > 0)

-- so if you try to modify a row in such a way that it would no longer be included 
-- in the view you will get ann error:


update
	invoices_with_balance_with_check_option
set
	payment_total = invoice_total
where
	invoice_id = 5;
    
-- if this querry executes, the error below will appear:
-- Error Code: 1369. CHECK OPTION failed 'sql_invoicing.invoices_with_balance_with_check_option'
-- < Error Code: 1369. CHECK OPTION failed 'sql_invoicing.invoices_with_balance_with_check_option' >

