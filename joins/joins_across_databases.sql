-- Joining Across Databases 
/*
use sql_store;

select
	*
from
	order_items o_ii
join 
	sql_inventory.products pp
    on
		o_ii.product_id = pp.product_id
order by
	o_ii.product_id desc;

*/

/*
use sql_inventory;

select 
	*
from
	products pp
join
	sql_store.order_items o_ii
    on
		pp.product_id = o_ii.product_id
order by
	pp.product_id desc;

*/
		