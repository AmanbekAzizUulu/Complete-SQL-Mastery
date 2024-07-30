-- The AND, OR and NOT Operators

use sql_store;
/*

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

select
    order_id,
    product_id,
    quantity,
    unit_price,
    unit_price * quantity as total_price
from 
    order_items
where 
    order_id = 6 or
    unit_price * quantity > 30;
*/ 

/*

select 
    order_id,
    product_id,
    quantity,
    unit_price,
    unit_price * quantity as total_price
from 
    order_items
where 
    unit_price 
				between 10 and 20 
                and
    product_id IN ('1', '2', '3');

*/
    
/*

Basic Logical Operators:

AND		- Combines multiple conditions and returns true only if all conditions are true.
OR 		- Combines multiple conditions and returns true if any of the conditions are true.
NOT 	- Negates a condition, returning true if the condition is false. 

*/
