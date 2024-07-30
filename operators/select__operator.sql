/*использовать базу данных 'sql_store' как основную для произведения sql запросов*/
use sql_store;

/*
-- in this example, we will fetch all the fields from the table 'customers':

select 
	* 
from 
	customers 
where 
	customer_id = 1 
order by 
	birth_date desc;

-- SELECT: 		Retrieve Data From One Or More Tables
-- ORDER BY: 	Sort The Result Set


				-- SELECT Statement in SQL --
-- The SELECT statement in SQL is used to fetch or retrieve data from a database. 
-- It allows users to access the data and retrieve specific 
-- data based on specific conditions.

-- We can fetch either the entire table or according to some specified rules. 
-- The data returned is stored in a result table. 
-- This result table is also called the result set. 
-- With the SELECT clause of a SELECT command statement, we specify the columns 
-- that we want to be displayed in the query result and, optionally, 
-- which column headings we prefer to see above the result table.

-- The SELECT clause is the first clause and is one of the last 
-- clauses of the select statement that the database server evaluates. 
-- The reason for this is that before we can determine what to include in 
-- the final result set, we need to know all of the possible columns that 
-- could be included in the final result set.

*/

/*
-- in this example, we will fetch 
									first_name, 
                                    last_name from the table 'customers':
                                    
select first_name, 
       last_name 
from customers;

*/


/*

select 
    first_name, 
    last_name, 
    points, 
    (points + 100) * 10 as 'discount factor' -- мы можем так же произвести арифметические,											 
from										 -- логические операции над выбираемыми столбцами
    customers;
    
*/

/*
-- in this example, we will fetch state from the table 'customers':

select 
	state 
from 
	customers;
    
*/


/*
-- изменение значения ячейки для покупалятеля с ID равным 1
update 
	customers 
set 
	state = 'VA'
where 
	customer_id = 1;
    
    
			-- UPDATE Statement in SQL --
-- The UPDATE statement in SQL is used to update the data of an existing 
-- table in the database. We can update single columns as well as multiple 
-- columns using the UPDATE statement as per our requirement.

-- In a very simple way, we can say that SQL commands(UPDATE and DELETE) 
-- are used to change the data that is already in the database. The SQL DELETE 
-- command uses a WHERE clause.

*/

/*
-- выборка уникальных элементов из столбца state

select distinct 
	state
from 
	customers;
  
  
  
-- DISTINCT: Select Unique Values From A Column.
*/

/*измнение наименования столбца name в product_name*/
-- statealter table products rename column name to product_name;

/*
-- использование оператора AS

select
	product_name,
	unit_price,
	round(unit_price * 1.1, 2) as 'new price'
from
	products;
    
*/

/*
-- выборка всех значений столбцов для покупателей с points > 300

select 
	*
from 
	customers
where
	points > 3000;
    
    
-- WHERE: Filter Rows Based On Specified Conditions.

-- WHERE keyword is used for fetching filtered data in a result set. 
-- It is used to fetch data according to particular criteria. 
-- WHERE keyword can also be used to filter data by matching patterns.
*/

/*

select
	*
from
	customers
where
	state = 'VA';
    
*/

/*

select
	*
from
	customers
where
	state != 'VA';
    
*/

/*

select 
	*
from 
	customers
where 
	birth_date > '1990-01-01'
order by
	birth_date desc;

*/

/*

select
	*
from 
	orders
where 
	order_date >= '2018-05-01'
order by 
	order_date desc;
*/


/*

select 
	*
from 
	customers
where 
	birth_date > '1990-01-01' or 
    points > 1000 and
    state = 'VA'
order by
	birth_date desc;
    
*/

/*

select 
	*
from 
	customers
where 
	birth_date > '1990-01-01' or
not
	points > 1000 and
    state = 'VA'
order by
	birth_date desc;
    
*/














