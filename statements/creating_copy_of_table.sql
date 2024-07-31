-- Creating a Copy of a Table

-- switch to the database named 'sql_store'
use sql_store;

/*
-- create a new table named 'archived_orders' and copy all data from 
   the 'orders' table into it

-- this statement is commented out and will not be executed.

create table 
	archived_orders 
    as
		select
			*
		from
			orders;
*/

-- the 'archived_orders' table has been truncated (all rows removed)
-- ( this is not shown in the script but would have been executed before the following insert operation )

-- Insert data into 'archived_orders' table using a SELECT statement

/*
insert into
	archived_orders
select 
	*
from
	orders
where
	order_date < '2019-01-01';
    
    
*/

-- exercise --

use sql_invoicing;

create table
	archived_invoices as
	select
		c.first_name as 'client\'s first name',
		i.invoice_id,     		 				-- Include all other necessary columns from 'invoices'
		i.number,
		i.invoice_total,
        i.payment_total,
        i.invoice_date,
        i.due_date,
        i.payment_date
	from
		invoices as i
	join 
		clients as c
        on
			i.client_id = c.client_id
	where
		i.payment_date is not null;
	
    
    -- Using the CREATE TABLE ... AS statement in SQL, you create a new table and populate it with data from an existing table or query.

-- Features:
-- 1. Table Creation: The statement creates a new table (table_name) based on the result of the SELECT query.
-- 2. Column Definition: The new table’s columns are automatically defined based on the columns returned by the SELECT query. The column names and data types are inferred from the result set.
-- 3. Data Insertion: The new table is populated with the data returned by the SELECT query. The data is copied from the source tables or queries into the new table.
-- 4. No Constraints or Indexes: The new table does not inherit any constraints (like primary keys or foreign keys) or indexes from the source table. These must be added separately if needed.
-- 5. Data Types: Data types for the new table’s columns are determined by the data types of the corresponding columns in the result set of the SELECT query.

-- Considerations:
-- 1. Column Names: Column names in the new table are taken from the SELECT query. If the SELECT query includes expressions or column aliases, these names will be used in the new table.
-- 2. Performance: Creating a table with the CREATE TABLE ... AS statement can be resource-intensive if the source query returns a large amount of data.
-- 3. Table Structure: The new table’s structure is determined solely by the SELECT query. If you need specific data types, constraints, or indexes, you must add them after table creation.
-- 4. Temporary Tables: This statement can be used to create temporary tables for intermediate processing. Temporary tables are session-specific and automatically dropped when the session ends.
-- 5. Permissions: You need appropriate permissions to create tables in the database and to access the data being queried.
	