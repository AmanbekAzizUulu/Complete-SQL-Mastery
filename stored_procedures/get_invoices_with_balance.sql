delimiter $$
create procedure get_invoices_with_balance ()
begin
    select 
        invoice_id AS invoice_id,
        invoice_number AS invoice_number,
		client_id AS client_id,
        invoice_total AS invoice_total,
        payment_total AS payment_total,
        (invoice_total - payment_total) AS balance,
        invoice_date AS invoice_date,
        due_date AS due_date,
        payment_date AS payment_date
    from
        invoices
    where
        (invoice_total - payment_total) > 0 ;
end $$
delimiter ;
    
