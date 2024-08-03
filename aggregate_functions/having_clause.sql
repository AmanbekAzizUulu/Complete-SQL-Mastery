-- Устанавливаем базу данных, с которой будем работать
-- use sql_invoicing;


/*
-- Выбираем данные из таблицы
select
    client_id,  						-- Выбираем идентификатор клиента
    sum(invoice_total) as total_sales 				-- Рассчитываем сумму всех счетов для каждого клиента и задаем имя колонки total_sales
from
    invoices as inv 						-- Из таблицы invoices, используя псевдоним inv
group by
    client_id 							-- Группируем результаты по идентификатору клиента
having
    total_sales >= 500; 					-- Фильтруем группы, оставляя только те, где сумма продаж total_sales больше или равна 500

-- Порядок выполнения запроса:

-- 1. USE sql_invoicing;
--    Этот оператор устанавливает базу данных sql_invoicing, в которой будет 
--    выполняться запрос. Это не часть запроса SELECT, но задает контекст, в 
--    котором запрос будет выполнен.

-- 2. FROM invoices as inv
--    Указывает, что данные будут извлечены из таблицы invoices, которая 
--    получает псевдоним inv. Псевдонимы используются для упрощения ссылок 
--    на таблицы и колонны.

-- 3. GROUP BY client_id
--    Группирует результаты по колонке client_id. Это означает, что агрегатные 
--    функции, такие как SUM(), будут вычисляться для каждой группы клиентов.

-- 4. SELECT client_id, SUM(invoice_total) AS total_sales
--    Выбирает колонки для отображения в результатах. Здесь выбирается client_id и 
--    сумма всех значений invoice_total для каждой группы. SUM(invoice_total) вычисляет 
--    сумму счетов для каждого клиента, а AS total_sales присваивает этому результату 
--    псевдоним total_sales.

-- 5. HAVING total_sales >= 500
--    Применяет фильтр к агрегированным данным, оставляя только те группы, где 
--    сумма продаж total_sales больше или равна 500. Этот фильтр применяется после 
--    группировки и агрегации данных.

-- Примечания:
-- 	HAVING фильтрует результаты после группировки, в отличие от WHERE, который фильтрует 
-- 	строки до группировки.
-- 	Порядок выполнения запросов в SQL обычно следует логике: 
-- 		сначала FROM и JOIN,
-- 		затем WHERE, 
-- 		потом GROUP BY, 
-- 		далее HAVING, 
--  	        после этого SELECT, и, 
-- 		наконец, ORDER BY.
*/

/*
select
    	client_id,
   	sum(invoice_total) as total_sales,
    	count(distinct client_id),
    	count(distinct invoice_id) as number_of_invoices,
	count(invoice_id)
from
	invoices
group by
	client_id
having 
	total_sales > 500 and
    	number_of_invoices > 5;
*/


-- exercise

-- Selects the database named sql_store
use sql_store;

-- Selects data from the database
select
    c.customer_id,  		    					 	 -- Selects the unique identifier for the customer
    c.first_name,   								 -- Selects the customer's first name
    c.last_name,    								 -- Selects the customer's last name
    sum(oi.quantity * oi.unit_price) as total_sales  				 -- Calculates the total sales amount for each customer
from
    customers as c  								 -- Specifies the table containing customer information, using an alias 'c'
join
    orders as o  								 -- Specifies the table containing orders, using an alias 'o'
    using (customer_id)  							 -- Joins 'orders' with 'customers' on the 'customer_id' column
join
    order_items as oi  								 -- Specifies the table containing items in each order, using an alias 'oi'
    on o.order_id = oi.order_id  				        	 -- Joins 'order_items' with 'orders' on the 'order_id' column
where 
    state = 'VA'  								 -- Filters the results to include only orders from the state 'VA'
group by
    c.customer_id,  								 -- Groups results by customer ID to aggregate sales data per customer
    c.first_name,   								 -- Also groups by customer's first name
    c.last_name     								 -- Also groups by customer's last name
having
    total_sales > 100;                       					 -- Filters groups to include only customers with total sales greater than 100

-- Explanation of Each Row:

-- 1.  `use sql_store;`
--     Specifies the database `sql_store` to use for the query execution.
-- 2.  `select`
--     Begins the selection of columns to retrieve from the specified tables.
-- 3.  `c.customer_id,`
--     Retrieves the customer ID from the `customers` table.
-- 4.  `c.first_name,`
--     Retrieves the first name of the customer from the `customers` table.
-- 5.  `c.last_name,`
--     Retrieves the last name of the customer from the `customers` table.
-- 6.  `sum(oi.quantity * oi.unit_price) as total_sales`
--     Calculates the total sales amount by multiplying `quantity` and `unit_price` from `order_items`, and then summing this value for each customer. This is labeled as `total_sales`.
-- 7.  `from customers as c`
--     Indicates that the query is selecting from the `customers` table and assigns it the alias `c`.
-- 8.  `join orders as o using (customer_id)`
--     Joins the `orders` table with the `customers` table using the `customer_id` column, which exists in both tables. The `orders` table is given the alias `o`.
-- 9.  `join order_items as oi on o.order_id = oi.order_id`
--     Joins the `order_items` table with the `orders` table on the `order_id` column to associate items with orders. The `order_items` table is given the alias `oi`.
-- 10.  `where state = 'VA'`
--     Filters the results to include only records where the state is 'VA'. This is applied before grouping.
-- 11.  `group by c.customer_id, c.first_name, c.last_name`
--     Groups the results by `customer_id`, `first_name`, and `last_name` so that aggregate functions like `SUM()` can be applied to each group of customers.
-- 12.  `having total_sales > 100`
--     Filters the grouped results to include only those customers whose total sales exceed 100. This is applied after grouping and aggregation.

-- This query provides a summary of total sales for each customer who has spent more than 100 units of currency in the state of Virginia, including their IDs and names.

-- Explanation of Order of Execution:

-- 1. FROM customers as c
--    Specifies the `customers` table as the source of data and assigns it the alias `c`.
-- 2. JOIN orders as o USING (customer_id)
--    Joins the `orders` table with `customers` on the `customer_id` column, combining rows from both tables where they have matching `customer_id` values.
-- 3. JOIN order_items as oi ON o.order_id = oi.order_id
--    Joins the `order_items` table with `orders` on the `order_id` column, combining rows from both tables where they have matching `order_id` values.
-- 4. WHERE state = 'VA'
--    Filters the rows to include only those where the `state` column has the value 'VA'. This is done after the joins but before grouping.
-- 5. GROUP BY c.customer_id, c.first_name, c.last_name
--    Groups the results by `customer_id`, `first_name`, and `last_name` to aggregate data for each customer.
-- 6. SELECT c.customer_id, c.first_name, c.last_name, SUM(oi.quantity * oi.unit_price) AS total_sales
--    Selects the columns to be included in the final result set and calculates the total sales for each group of customers.
-- 7. HAVING total_sales > 100
--    Filters the grouped results to include only those customers whose `total_sales` exceed 100. This is done after grouping and aggregation.

-- The overall execution order ensures that the data is joined and filtered appropriately before aggregation, and finally, the results are filtered based on the aggregate values.
