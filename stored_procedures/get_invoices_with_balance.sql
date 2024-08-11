delimiter $$
create procedure get_invoices_with_balance ()
begin
    select 
        invoices.invoice_id AS invoice_id,
        invoices.invoice_number AS invoice_number,
		invoices.client_id AS client_id,
        invoices.invoice_total AS invoice_total,
        invoices.payment_total AS payment_total,
        (invoices.invoice_total - invoices.payment_total) AS balance,
        invoices.invoice_date AS invoice_date,
        invoices.due_date AS due_date,
        invoices.payment_date AS payment_date
    from
        invoices
    where
        (invoices.invoice_total - invoices.payment_total) > 0 ;
end $$
delimiter ;
    