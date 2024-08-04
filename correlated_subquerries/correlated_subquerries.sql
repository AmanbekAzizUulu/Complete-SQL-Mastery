-- Correlated subquerries 

-- Select all columns from the 'employees' table where the salary is below the average salary in the same office

/*
use sql_hr;


select
    * 											-- Select all columns from the employees table
from
    employees as empls_outer 					-- Alias for the outer query table
where
    salary < 									-- Filter to include only those rows where the salary is below the average salary
    (
        select									-- Subquery to calculate the average salary for each office
            avg(salary) 						-- Calculate the average salary
        from
            employees as empls_inner 			-- Alias for the inner query table
        where
            office_id = empls_outer.office_id 	-- Ensure the average salary is calculated for the same office as the outer query
    );
    
*/

-- exercise

-- get invoices that are larger than the client's average invoice amount

use sql_invoicing;

				
select											-- Select all columns from the 'invoices' table where the invoice total is greater than the average invoice total for the same client
    * 											-- Select all columns from the 'invoices' table
from
    invoices as inv_outer 						-- Alias for the outer query table (represents the current row in the main query)
where
    invoice_total > 							-- Condition to filter invoices where the total amount is greater than the average total for the same client
    (
        select									-- Subquery to calculate the average invoice total for each client		
            avg(invoice_total) 					-- Calculate the average total invoice amount
        from
            invoices as inv_inner 				-- Alias for the inner query table (used in the subquery)
        where
            client_id = inv_outer.client_id 	-- Ensure the average is calculated for invoices from the same client as the current row in the outer query
    );

