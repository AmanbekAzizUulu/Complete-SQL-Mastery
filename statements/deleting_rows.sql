-- Deleting rows

-- switch to the 'sql_invoicing' database
use sql_invoicing;

-- delete rows from the 'invoices' table where the 'client_id' 
-- matches the ID of a client whose first name is 'Myworks'

delete from
	invoices
where								-- specify the condition for deleting rows
	client_id = (
		select 						-- subquery to find the 'client_id' from the 'clients' table
			client_id
		from
			clients
		where						-- condition to match the client's first name
			first_name = 'Myworks'
    );