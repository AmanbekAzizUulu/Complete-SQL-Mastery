drop procedure if exists get_unpaid_invoices_for_client_without_output;

delimiter $$

create procedure get_unpaid_invoices_for_client_without_output(
	in client_id int
)

begin
	select 
		count(*),
        sum(invoice_total)
	from
		invoices as inv 
	where
		inv.client_id = client_id and 
        inv.payment_total = 0;
end $$

delimiter ;