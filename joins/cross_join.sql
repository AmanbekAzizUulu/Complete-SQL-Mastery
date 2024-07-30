-- The Cross Join

use sql_store;

/*

-- explicit syntax
select
	*
from 
	customers as c
cross join
	products as p;
 
 */

/*

-- implicit syntax
select
	*
from 
	customers as c, 
    orders as o;
    
*/

-- exercise 

-- 1
select
	*
from
	shippers as sh
cross join 
	products as pr;
    
-- 2
select
	*
from
	shippers as sh,
    products as pr,
    orders as o;


-- every record in the customers table, will
-- be combined with every record in the products table;
-- and that is why we don't have a condition here -
-- this is what we call a cross join

-- cross join
-- returns the Cartesian product of two tables, meaning each row of the first table 
-- is combined with each row of the second table;
-- as a result, every combination of rows from the first table is paired with every 
-- row from the second table

-- A real example: 
-- - for using cross joins is where you have a table of sizes like 
-- 		- small, 
-- 		- medium, 
-- 		- large, 
-- - and a table of colors like
-- 		- red, 
-- 		- blue, 
-- 		- green, 
-- 		- whatever
-- - and then you want to combine all the sizes to all the colors -that is when you use a cross join.