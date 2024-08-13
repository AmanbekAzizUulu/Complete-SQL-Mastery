-- Drop the function if it already exists to avoid errors during creation
drop function if exists get_risk_factor_for_client;

-- Set the delimiter to $$ to define the function body
delimiter $$

-- Create the function named 'get_risk_factor_for_client' with one input parameter
create function get_risk_factor_for_client(
    client_id int                       -- Input parameter for the client ID
)

returns integer                       -- The function returns an integer value
-- deterministic                      -- Uncomment if the function always returns the same result for the same inputs
-- modifies sql data                   -- Uncomment if the function modifies database state (not applicable here)
    reads sql data                     -- The function only reads data and does not modify it
begin
    -- Declare local variables to store intermediate results
    declare risk_factor decimal(9, 2) default 0;  -- Variable to store the calculated risk factor
    declare invoices_total decimal(9, 2);         -- Variable to store the total invoice amount
    declare invoices_count int;                   -- Variable to store the count of invoices
    
    -- Calculate the total number of invoices and their total amount for the given client
    select 
        count(*),                             -- Count the number of invoices
        sum(invoice_total)                    -- Sum the total invoice amount
    into
        invoices_count,                       -- Store the count of invoices in invoices_count
        invoices_total                        -- Store the total invoice amount in invoices_total
    from
        invoices as inv                      -- From the invoices table, aliased as 'inv'
    where
        inv.client_id = client_id;           -- Where the client_id matches the input client_id
    
    -- Calculate the risk factor based on the total invoice amount and count
    set risk_factor = invoices_total / invoices_count * 5;
    
    -- Return the calculated risk factor
    return ifnull(risk_factor, 0);
end $$

-- Reset the delimiter to the default semicolon
delimiter ;
