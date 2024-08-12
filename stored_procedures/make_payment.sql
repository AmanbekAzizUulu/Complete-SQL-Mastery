-- Drop the procedure if it already exists to avoid errors during creation
drop procedure if exists make_payment;

-- Set the delimiter to $$ to define the procedure body
delimiter $$

-- Create the procedure named 'make_payment' with three input parameters
create procedure make_payment(
    in invoice_id int,                 -- Input parameter for the invoice ID
    in payment_amount decimal(9,2),    -- Input parameter for the payment amount with two decimal places
    in payment_date date               -- Input parameter for the payment date
)

begin
    -- Check if the payment amount is less than or equal to zero
    if payment_amount <= 0 then
        -- If the payment amount is invalid, raise an error with a specific message
        signal sqlstate '22003' 
        set message_text = 'invalid payment amount';
    end if; 
    
    -- Update the 'invoices' table, aliasing it as 'inv'
    update 
        invoices as inv 
    set 
        inv.payment_total = payment_amount,   -- Set the payment_total field to the provided payment amount
        inv.payment_date = payment_date       -- Set the payment_date field to the provided payment date
    where
        inv.invoice_id = invoice_id;          -- Update the record where the invoice_id matches the provided ID
end $$

-- Reset the delimiter to the default semicolon
delimiter ;
