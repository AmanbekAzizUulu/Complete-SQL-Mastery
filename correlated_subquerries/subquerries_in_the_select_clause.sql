-- Subqueries in the 'select' clause

/*

use sql_invoicing;

-- method #_1
select
	invoice_id,
    invoice_total,
	(
		select
			avg(invoice_total) 
		from
			invoices
	) as invoice_average,
    invoice_total - (select invoice_average) as difference
from 
	invoices
group by
	invoice_id
;

*/

/*
-- method #_2

set @invoice_average = (
		select
			avg(invoice_total) 
		from
			invoices
);

select
	invoice_id,
    invoice_total,
	round((invoice_total - @invoice_average), 2) as difference
from 
	invoices
group by
	invoice_id

*/

use sql_invoicing;

set @average = (
	select
		avg(invoice_total)
	from
		invoices
);

/*

-- selecting without null values
select
	distinct client_id,
    (
		select
			first_name
		from
			clients 
		where
			client_id = outer_inv.client_id
	) as first_name,
    (
		select
			sum(invoice_total) as total_sales
		from
			invoices
		where
			client_id = outer_inv.client_id
		group by
			outer_inv.client_id
    ) as total_sales,
    round((@average), 2) as average,
    round(((select total_sales) - @average), 2) as difference
from 
	invoices as outer_inv
;

*/




-- selecting with null values
select
	client_id,
    first_name,
    (
		select
			sum(invoice_total) as total_sales
		from
			invoices as inv
		where
			cl.client_id = inv.client_id
		group by
			inv.client_id
    ) as total_sales,
    round((@average), 2) as average,
    round(((select total_sales) - @average), 2) as difference
from
	clients as cl
    
-- see explanation in
-- subqueries_in_the_select_clause__code_explanation.md file

 
    