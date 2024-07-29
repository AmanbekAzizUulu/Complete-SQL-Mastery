-- Compound Join Conditions

use sql_store;

select
	*
from
	order_item_notes
join 
	order_items
    on
		order_item_notes.order_id = order_items.order_id
	and 
		order_item_notes.product_id = order_items.product_id
order by
	order_items.order_id;
    