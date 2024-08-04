-- The ROLLUP Operator 

/*
use sql_invoicing;

-- for single table
select
	client_id,
    sum(invoice_total) as total_sales
from
	invoices as inv
group by
	client_id with rollup;
*/


/*

-- for multiple tables
						-- Selects data from the database
select
    cl.state,  					-- Selects the state from the clients table
    cl.city,   					-- Selects the city from the clients table
    count(inv.client_id),  			-- Counts the number of invoices for each client
    sum(inv.invoice_total) as total_sales	-- Calculates the total sales amount for each group
from
    invoices as inv  				-- Specifies the invoices table, using an alias 'inv'
right join
    clients as cl				-- Specifies the clients table, using an alias 'cl'
    on inv.client_id = cl.client_id		-- Joins invoices with clients on the client_id column
group by
    state, 				 	-- Groups results by state
    city    					-- Groups results by city
    with rollup;  				-- Includes subtotals and grand totals for each grouping level

-- Explanation of Order of Execution:

-- 1. FROM invoices as inv
--    Specifies the `invoices` table as the source of data and assigns it the 
--    alias `inv`.

-- 2. RIGHT JOIN clients as cl ON inv.client_id = cl.client_id
--    Right joins the `clients` table with `invoices` on the `client_id` column, 
--    combining rows from both tables where they have matching `client_id` values. 
--    This will include all rows from the `clients` table and the matching rows from 
--    the `invoices` table.

-- 3. SELECT cl.state, cl.city, COUNT(inv.client_id), SUM(inv.invoice_total) AS total_sales
--    Selects the state and city from the `clients` table, counts the number of invoices 
--    for each client, and calculates the total sales for each group.

-- 4. GROUP BY state, city WITH ROLLUP
--    Groups the results by `state` and `city` to aggregate data. The `WITH ROLLUP` 
--    operator adds subtotal rows for each grouping level and a grand total row at 
--    the end.

-- The overall execution order ensures that the data is joined and filtered appropriately 
-- before grouping and aggregation. The `WITH ROLLUP` operator provides subtotals at 
-- each level of grouping and a grand total.

*/

-- exercise

-- querry #_1
select
	pms.payment_method_name,
    sum(ps.amount) as total
from
	payments as ps
join
	payment_methods pms
    on
		ps.payment_method_id = pms.payment_method_id
group by
	payment_method_name with rollup;
    
-- querry #_2
select
	pms.payment_method_name,
    sum(ps.amount) as total
from
	payments as ps
join
	payment_methods pms
    on
		ps.payment_method_id = pms.payment_method_id
group by
	payment_method_name,
    ps.amount with rollup;
    
-- differences between this 2 querries read in 'rollup_explanation.md' file
    

