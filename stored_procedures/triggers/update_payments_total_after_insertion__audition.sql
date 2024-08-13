drop trigger if exists update_payments_total_after_insertion_audition;
-- Deletes the trigger named update_payments_total_after_insertion_audition if it already exists to avoid errors when creating the new trigger.

delimiter $$
-- Sets a new delimiter for commands (in this case, $$), since the trigger contains multiple SQL statements, and the standard delimiter `;` could cause issues.

create trigger update_payments_total_after_insertion_audition
    after insert on payments
    for each row 
-- Creates a trigger named update_payments_total_after_insertion_audition that fires after a new row is inserted into the payments table. The trigger will execute separately for each inserted row.

begin
-- Begins the block containing the SQL statements that should be executed when the trigger fires.

    update 
        invoices 
    set 
        payment_total = payment_total + new.amount 
    -- Updates the invoices table by increasing the payment_total field by the amount specified in the newly inserted row in the payments table.
    
    where
        invoice_id = new.invoice_id;
    -- The update condition: only the row in the invoices table where invoice_id matches the invoice_id in the newly inserted row in the payments table is modified.

    insert into 
        payments_audit
    -- Inserts a new record into the payments_audit table to log the insertion action.

    values(
        new.client_id,
        new.payment_date,
        new.amount,
        'insertion',
        now()
    );
    -- Specifies the values to insert into the payments_audit table:
    -- new.client_id to log the client ID from the newly inserted row,
    -- new.payment_date to log the payment date from the newly inserted row,
    -- new.amount to log the amount from the newly inserted row,
    -- 'insertion' as the action type to indicate that this log entry is for an insertion,
    -- now() to log the current timestamp when the insertion occurred.

end $$
-- Ends the block of trigger statements.

delimiter ;
-- Restores the standard command delimiter `;`.
