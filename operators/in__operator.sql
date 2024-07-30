-- The IN Operator 

use sql_store;

/*
-- without IN operator:
select 
	*
from 
	customers
where 
	state = 'VA' or
	state = 'GA' or
    state = 'FL';

-- using the IN operator:
select 
	*
from 
	customers
where 
	state in ('VA','GA','FL');
    
   
-- combinig NOT logical operator with operator IN
select 
	*
from 
	customers
where 
	state not in ('VA','GA','FL'); 	-- выбрать все строки, 
									-- у которых ячейки state 
									-- не равны VA или GA или FL

-- Example -- 
select 
	*
from 
	products 
where 
	quantity_in_stock in (49, 38, 72);
*/

/*

-- Description --

BETWEEN		- Checks if a value is within a specified range.
IN			- Checks if a value is within a set of values.
LIKE		- Used for pattern matching with wildcard characters ( %  for any sequence of characters, 
																   _  for a single character).
IS NULL		- Checks if a value is null. 	
IS NOT NULL - Checks if a value is not null.


-- Summary of Logical Operators --

AND 		- Combines multiple conditions; all must be true.
OR			- Combines multiple conditions; any must be true.
NOT			- Negates a condition.
BETWEEN		- Checks if a value is within a range.
IN			- Checks if a value is within a set of values.
LIKE 		- Pattern matching.
IS NULL		- Checks for null values.
IS NOT NULL -Checks for non-null values.

These operators are fundamental for 
	- creating complex and precise SQL queries, 
    - enabling detailed data filtering and retrieval.

*/