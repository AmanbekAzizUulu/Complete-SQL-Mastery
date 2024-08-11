use sql_store;

/*

select
	order_id,
--  ifnull(shipper_id, 'not_assigned_yet') as shipper_id
	coalesce(shipper_id, comments, 'not_assigned_yet')
from
	orders;

*/  


-- IFNULL(expr1,expr2)
-- If expr1 is not NULL, IFNULL() returns expr1; otherwise it returns expr2

-- COALESCE(expression_1, expression_2, ..., expression_n)
-- Функция COALESCE() возвращает первый ненулевой (не NULL) аргумент из списка. Она полезна, если нужно проверить несколько столбцов или выражений и вернуть первое ненулевое значение.



-- excersice

select
	concat(first_name, ' ', last_name) as 'customer\'s full name',
--    ifnull(phone_number, 'unknown') as 'customer\'s phone number'
	coalesce(phone_number, 'unknown')
from
	customers;