drop trigger if exists update_payments_total_after_insert;
-- Deletes the trigger named update_payments_total_after_insert if it already exists to avoid errors when creating a new trigger.

delimiter $$
-- Sets a new delimiter for commands (in this case, $$) because the trigger contains multiple SQL statements, and the standard delimiter `;` could cause issues.

create trigger update_payments_total_after_insertion
    after insert on payments
    for each row 
-- Creates a trigger named update_payments_total_after_insertion that fires after a new row is inserted into the payments table. The trigger will execute separately for each new row.

begin
-- Begins the block containing the SQL statements that should be executed when the trigger fires.

    update 
        invoices 
    set 
        payment_total = payment_total + new.amount 
    -- Updates the invoices table, increasing the payment_total field by the amount specified in the new row of the payments table.
    
    where
        invoice_id = new.invoice_id;
    -- The update condition: only the row in the invoices table where the invoice_id matches the invoice_id in the new row of the payments table is modified.

end $$
-- Ends the block of trigger statements.

delimiter ;
-- Restores the standard command delimiter `;`.


-- Trigger Recursion --
-- If you modify the 'payments' table within a trigger that is itself triggered by an INSERT into the 'payments' table, it can cause the trigger to fire again. 
-- This could lead to an infinite loop of trigger executions unless the database has mechanisms to prevent such recursive behavior (e.g., a maximum recursion depth).

-- so we can modify data in any table except 'payments' table