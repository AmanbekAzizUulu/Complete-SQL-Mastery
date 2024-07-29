/*используй базу данных sql_store для произведения sql запросов*/
use sql_store;

/*
-- выборка всех значений столбцов для покупателя с ID равным 1

select 
	* 
from 
	customers 
where 
	customer_id = 1 
order by 
	birth_date desc;

*/

/*

select first_name, 
       last_name 
from customers;

*/


/*

select 
    first_name, 
    last_name, 
    points, 
    (points + 100) * 10 as 'discount factor'
from
    customers;
    
*/

/*

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
*/

/*
-- выборка уникальных элементов из столбца state

select distinct 
	state
from 
	customers;
    
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
/*
-- The AND, OR and NOT Operators

select 
    order_id,
    product_id,
    quantity,
    unit_price,
	unit_price * quantity as total_price
from 
	order_items
where 
	order_id = 6 and
    unit_price * quantity > 30;

*/

/*

-- The IN Operator 

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
	state not in ('VA','GA','FL'); 	-- выбрать все строки, у которых ячейки state не равны VA или GA или FL
    
select 
	*
from 
	products 
where 
	quantity_in_stock in (49, 38, 72);
    
*/


/*
-- The BETWEEN Operator

-- without BETWEEN operator

select 
	*
from 
	customers
where 
	points >= 1000 and
    points <= 3000;
    
-- using the BETWEEN operator

select 
	*
from 
	customers
where 
	points between 1000 and 
				   3000;

select 
	*
from
	customers 
where 
	birth_date between '1990-01-01' and 
					   '2000-01-01';
                       
*/













