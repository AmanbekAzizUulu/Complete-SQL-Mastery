drop trigger if exists update_invoices_total_after_deleting;
-- Deletes the trigger named update_invoices_total_after_deleting if it already exists, to avoid errors when creating a new trigger.

delimiter $$
-- Sets a new delimiter for commands (in this case, $$), because the trigger contains multiple SQL statements, and the standard delimiter `;` could cause issues.

create trigger update_invoices_total_after_deleting
    after delete on payments
    for each row
-- Creates a trigger named update_invoices_total_after_deleting that fires after a row is deleted from the payments table. The trigger will execute separately for each deleted row.

begin
-- Begins the block containing the SQL statements that should be executed when the trigger fires.

    update
        invoices 
    set 
        payment_total = payment_total - old.amount 
    -- Updates the invoices table by decreasing the payment_total field by the amount specified in the deleted row of the payments table.
    
    where
        invoice_id = old.invoice_id;
    -- The update condition: only the row in the invoices table where invoice_id matches the invoice_id in the deleted row of the payments table is modified.

end $$
-- Ends the block of trigger statements.

delimiter ;
-- Restores the standard command delimiter `;`.
