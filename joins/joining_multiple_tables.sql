-- Joining Multiple Tables
/*
use sql_store;

select
	order_id,
    order_date,
    customers.first_name,
    customers.last_name,
    order_statuses.status_name as state
from 
	orders
join
	order_statuses
    on
		orders.order_status = order_statuses.order_status_id
join
	customers
	on
		orders.customer_id = customers.customer_id;
        
*/

/**/
-- Exercise
use sql_invoicing;

select
	
	payment_id,
    
    -- retrieving information about client
    clients.first_name,
    clients.city,
    clients.state,
    clients.address,
    clients.phone,
    
    -- retrieving information about payment method
    payment_methods.payment_method_name
from
	payments 
join
	clients
    on	-- parsing rows
		payments.client_id = clients.client_id
join
	payment_methods
    on	-- parsing rows
		payments.payment_method = payment_methods.payment_method_id
order by payment_id;