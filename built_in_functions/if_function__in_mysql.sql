use sql_store;

/*
-- using UNION clause
select
	order_id,
    shipped_date,
    'active order' as order_status
from
	orders
where
	shipped_date >= '2024-01-01'
union

select
    order_id,
    shipped_date,
    'archived order' as order_status
from
	orders
where
	shipped_date < '2024-01-01';

*/

/*
SELECT 
    CASE 
        WHEN shipped_date >= '2024-01-01' THEN order_id 
        ELSE NULL 
    END AS 'active order',
    CASE 
        WHEN shipped_date < '2024-01-01' THEN order_id 
        ELSE NULL 
    END AS 'archived order'
FROM orders;
*/

/*
-- using IF(condition, value_1, value_2) function
select
	order_id,
    order_date,
    if(year(order_date)>= '2024-01-01', 'archived', 'active') as order_status
from
	orders;
 
 */
 
-- exercise

-- selecting product_id from order_items and product_name from products
select
    order_items.product_id,  													-- selects the product_id from order_items table
    products.product_name,   													-- selects the product_name from products table
    count(order_items.quantity) as count_of_orders,  							-- counts the number of times a product was ordered
    if(count(order_items.quantity) > 1, 'multiple times', 'once') AS frequency  -- checks if the product was ordered more than once and assigns a label
from
    order_items  																-- specifies the order_items table as the source of the first selection
join
    products  																	-- joins the products table with order_items
	using
    (product_id)  																-- joins both tables using the product_id column which they share
group by
    order_items.product_id  													-- groups the result set by product_id
order by
    product_id;  																-- orders the result set by product_id in ascending order

        
    
-- mysql documentations about 'if' statement
-- < https://dev.mysql.com/doc/refman/8.4/en/if.html >