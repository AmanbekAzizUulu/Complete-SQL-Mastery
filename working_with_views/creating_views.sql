use sql_invoicing;

/*
-- creating view
create view 
	sales_by_client as 
	select
		cl.client_id,
		cl.first_name,
		ifnull(sum(inv.invoice_total), '0') as total_sales
	from
		clients as cl
	left join
		invoices as inv
		using
			(client_id)
	group by
		cl.client_id;

*/

-- working with view
/*
select
	*
from
	sales_by_client
order by 
	total_sales desc;
*/

/*
select
	*
from
	sales_by_client
where
	total_sales > 600;
*/

/*
select
	*
from
	sales_by_client
join
	clients
    using
		(client_id);
*/

-- creating other view
create view 
	clients_balance as 
	select
		client_id,
		first_name,
		ifnull(
				sum(abs(inv.payment_total - inv.invoice_total)), 
															0) as balance
	from
		clients as cl
	left join
		invoices as inv
		using
			(client_id)
	group by
		client_id
	

