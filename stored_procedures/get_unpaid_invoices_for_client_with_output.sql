-- Drop the procedure if it already exists to avoid errors during creation
drop procedure if exists get_unpaid_invoices_for_client_with_output;

-- Set the delimiter to $$ to define the procedure body
delimiter $$

-- Create the procedure named 'get_unpaid_invoices_for_client_with_output'
-- with one input parameter and two output parameters
create procedure get_unpaid_invoices_for_client_with_output(
    in client_id int,                     -- Input parameter for the client ID
    out invoices_count tinyint,           -- Output parameter to store the count of unpaid invoices
    out invoices_total decimal(9, 2)      -- Output parameter to store the total amount of unpaid invoices
)

begin
    -- Select the count and sum of unpaid invoices for the given client
    select 
        count(*),                         -- Count the number of unpaid invoices
        sum(invoice_total)                -- Calculate the total of unpaid invoices
    into
        invoices_count,                   -- Store the count in the output parameter invoices_count
        invoices_total                    -- Store the total in the output parameter invoices_total
    from
        invoices as inv                   -- From the invoices table, aliased as 'inv'
    where
        inv.client_id = client_id and     -- Where the client_id matches the input client_id
        inv.payment_total = 0;            -- And the payment_total is 0, indicating unpaid invoices
end $$

-- Reset the delimiter to the default semicolon
delimiter ;
