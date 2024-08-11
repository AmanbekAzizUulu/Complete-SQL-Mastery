drop procedure if exists get_invoices_by_client_id_1;

delimiter $$
create procedure get_invoices_by_client_id_1(
	in client_id int
)

begin
	declare affected_row_count int;
    
	select
		*
	from
		invoices as inv
	where
		inv.client_id = client_id;
	
    select found_rows() into affected_row_count;
    
    if affected_row_count = 0 then
		select
			0 as invoice_id, 
			'No Invoice' as invoice_number, 
			client_id as client_id, 
			0.00 as invoice_total, 
			0.00 as payment_total, 
			0.00 as balance, 
			null as invoice_date, 
			null as due_date, 
			null as payment_date;
		end if;
end