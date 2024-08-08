-- Subqueries in the FROM Clause
-- Используем базу данных sql_invoicing
USE sql_invoicing;

-- Определяем переменную @average, которая будет хранить среднее значение всех сумм счетов
set @average = (
    select
        avg(invoice_total)											-- Вычисляем среднее значение суммы счетов
    from
        invoices 													-- Из таблицы invoices
);

select 																-- Выполняем основной SELECT-запрос
    *																-- Выбираем все поля из временной таблицы sales_summary
from 
(   
    -- Вложенный запрос для формирования временной таблицы sales_summary
    select
        client_id, 													-- Идентификатор клиента
        first_name,	 												-- Имя клиента
        (
            select												    -- Вложенный запрос для вычисления общей суммы продаж для каждого клиента
                SUM(invoice_total) as total_sales 					-- Вычисляем сумму всех счетов для текущего клиента
            from
                invoices as inv 									-- Из таблицы invoices
            where
                cl.client_id = inv.client_id 						-- Условие: сопоставляем счета с текущим клиентом
            group by
                inv.client_id 										-- Группируем по client_id (идентификатору клиента)
        ) AS total_sales, 											-- Результат суммы счетов записываем в поле total_sales
        round((@average), 2) as average, 							-- Округляем среднее значение до двух знаков после запятой и записываем в поле average
        round(((select total_sales) - @average), 2) as difference 	-- Вычисляем разницу между общей суммой продаж и средним значением
    from
        clients as cl 												-- Из таблицы clients
) as sales_summary 													-- Назначаем временное имя результирующей таблице
where
    total_sales is not null; 										-- Отфильтровываем записи, где total_sales не является NULL (неопределённым значением)
