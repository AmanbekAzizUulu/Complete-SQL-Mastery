-- The LIMIT Clause

/*
select
	*
from 
	customers
limit 
	5;

 

select 
	*
from
	customers
limit
	5, 3; -- skip 5 and then pick 3

*/

-- Exercise --

select
	*
from
	customers
order by 
	points desc
limit 
	3;
    
/*

Explanation

The LIMIT clause in SQL is used to specify the maximum number of rows that the 
result set should contain. It's often used in conjunction with the ORDER BY clause 
to get the top N rows from a query.

Here is the basic syntax:

SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ...
LIMIT number_of_rows;


Examples

1. Retrieve the top 10 rows from a table:**
   
    SELECT *
    FROM employees
    ORDER BY salary DESC
    LIMIT 10;
  
    This query will return the top 10 highest salaries from the employees table.

2. Combined with multiple columns in `ORDER BY`:**
    
    SELECT *
    FROM employees
    ORDER BY department_id, salary DESC
    LIMIT 5;
   
    This query will sort the results first by department_id and then by salary 
    in descending order within each department, returning the top 5 rows overall.

Using OFFSET

You can also use OFFSET along with LIMIT to skip a certain number of rows before 
starting to return rows from the query:

SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ...
LIMIT number_of_rows OFFSET offset_value;


Example:

SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 10 OFFSET 5;


This query will skip the first 5 rows of the sorted result and return the next 10 rows.

*/