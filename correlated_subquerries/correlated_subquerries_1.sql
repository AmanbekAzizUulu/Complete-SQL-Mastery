use sql_invoicing;


-- select clients that have an invoice 

/*
-- method #1 
select
	*
from
	clients
where
	client_id in 
			(
				select
					distinct client_id
				from
					invoices
            )
;
*/

/*

-- method #2 
select 
	*
from
	clients as cl
where exists 
		(
			select
				distinct client_id
			from 
				invoices as inv
			where 
				client_id = cl.client_id
        )
;

*/
-- exercise
-- find the products that have never been ordered 


use sql_store; 					-- Переключаемся на базу данных sql_store

select						-- Выбираем все столбцы из таблицы products
    *
from
    products as p
where exists 					-- Фильтруем строки, возвращая только те, для которых подзапрос внутри EXISTS возвращает хотя бы одну строку
    (
        select					-- Подзапрос: выбираем уникальные значения product_id из таблицы order_items
            distinct product_id
        from 
            order_items as oi
       
        where 					-- Условие связывает подзапрос с внешним запросом, проверяя, 
	    product_id = p.product_id		-- что product_id в подзапросе равен product_id из текущей строки внешнего запроса      
    );
