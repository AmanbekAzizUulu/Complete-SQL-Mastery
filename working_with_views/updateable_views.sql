use sql_invoicing;

-- updateable view

create or replace
view invoices_with_balance as
	select
		invoice_id,
		invoice_number,
		client_id,
		invoice_total,
		payment_total,
		invoice_total - payment_total as balance,
		invoice_date,
		due_date,
		payment_date
	from
		invoices
	where 
		(invoice_total - payment_total) > 0;
      

-- Updatable Views: Views are updatable if they meet certain criteria, such as:
--    - not using 
-- 				GROUP BY, 
-- 				DISTINCT, or 
-- 				aggregate functions;
--    - not involving joins that make it unclear where the data should be inserted or updated;
--    - not including expressions or functions in the column list


-- Когда вы выполняете `INSERT`, `UPDATE` или `DELETE` через представление (view) в SQL, 
-- вы фактически изменяете данные в базовых таблицах, из которых это представление 
-- создано. Это связано с тем, что представление — это всего лишь логическое представление 
-- данных, которое создается на основе одной или нескольких таблиц.

