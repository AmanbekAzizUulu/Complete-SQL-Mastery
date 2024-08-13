drop trigger if exists update_payments_total_after_deletion_audition;
-- Deletes the trigger named update_payments_total_after_deletion_audition if it already exists to avoid errors when creating the new trigger.

delimiter $$
-- Sets a new delimiter for commands (in this case, $$), since the trigger contains multiple SQL statements, and the standard delimiter `;` could cause issues.

create trigger update_payments_total_after_deletion_audition
    after delete on payments
    for each row
-- Creates a trigger named update_payments_total_after_deletion_audition that fires after a row is deleted from the payments table. The trigger will execute separately for each deleted row.

begin
-- Begins the block containing the SQL statements that should be executed when the trigger fires.

    update
        invoices 
    set 
        payment_total = payment_total - old.amount 
    -- Updates the invoices table by decreasing the payment_total field by the amount specified in the deleted row from the payments table.
    
    where
        invoice_id = old.invoice_id;
    -- The update condition: only the row in the invoices table where invoice_id matches the invoice_id in the deleted row of the payments table is modified.

    insert into 
        payments_audit
    -- Inserts a new record into the payments_audit table to log the deletion action.

    values(
        default,
        old.client_id,
        old.payment_date,
        old.amount,
        'deletion',
        now()
    );
    -- Specifies the values to insert into the payments_audit table:
    -- 'default' for the primary key (auto-incremented),
    -- old.client_id to log the client ID from the deleted row,
    -- old.payment_date to log the payment date from the deleted row,
    -- old.amount to log the amount from the deleted row,
    -- 'deletion' as the action type to indicate that this log entry is for a deletion,
    -- now() to log the current timestamp when the deletion occurred.

end $$
-- Ends the block of trigger statements.

delimiter ;
-- Restores the standard command delimiter `;`.
