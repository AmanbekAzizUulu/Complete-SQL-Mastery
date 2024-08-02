use sql_invoicing;


-- при использовании GROUP BY, каждый выбранный столбец 
-- должен быть 
-- 		либо включен в GROUP BY, 
-- 		либо использован в агрегатной функции

/*
-- group by a single column
select
	client_id,
	sum(invoice_total) as total_sales,
    client_id - non grouped,
    invoice_total - non grouped
from
	invoices
where 
	invoice_date >= '2019-07-01'
group by
	client_id
order by 
	total_sales desc;
*/


/*
select 
    agg.client_id AS grouped_client_id, 	-- Selecting client_id from the subquery (agg) and aliasing it as grouped_client_id
    agg.total_sales,                    	-- Selecting total_sales from the subquery (agg)
    inv.client_id AS non_grouped_client_id, -- Selecting client_id from the invoices table and aliasing it as non_grouped_client_id
    inv.invoice_total                   	-- Selecting invoice_total from the invoices table
from 
    (select 
        client_id,                      	-- Selecting client_id in the subquery
        sum(invoice_total) as total_sales 	-- Summing up invoice_total for each client_id and aliasing it as total_sales
     from 
        invoices                        	-- From the invoices table
     wher 
        invoice_date >= '2019-07-01'    	-- Filtering records where invoice_date is on or after '2019-07-01'
     group by 
        client_id) as agg               	-- Grouping the results by client_id and aliasing the subquery as agg
join 
    invoices as inv                     	-- Joining the subquery (agg) with the invoices table and aliasing it as inv
on 
    agg.client_id = inv.client_id       	-- Joining on client_id
where 
    inv.invoice_date >= '2019-07-01'    	-- Filtering records from the invoices table where invoice_date is on or after '2019-07-01'
order by
    agg.total_sales desc;               	-- Ordering the final results by total_sales in descending order

    
 */
 
 
/*
-- group by multiple columns
select
	cl.client_id,
    cl.first_name,
    cl.state,
    cl.city,
    sum(invoice_total) as total_sales
from
	invoices as inv
join
	clients as cl
    using
		(client_id)
where 
	invoice_date >= '2019-07-01'
group by
	cl.client_id,
	cl.first_name,
	cl.state,
    cl.city
order by
	total_sales desc;
*/

/*
select
	inv.client_id,
    sum(invoice_total) as 	total_sales
from
	invoices as inv
join
	clients as cl 
    on
		inv.client_id = cl.client_id
where 
	inv.invoice_date >= '2019-07-01'
group by
	inv.client_id
order by 
	cl.client_id desc;

*/

/*
select
    cl.state,                           -- Selecting the state from the clients table
    cl.city,                            -- Selecting the city from the clients table
    sum(invoice_total) as total_sales   -- Calculating the sum of invoice_total and aliasing it as total_sales
from
    invoices as inv                     -- From the invoices table aliased as inv
join
    clients as cl                       -- Joining the clients table aliased as cl
on
    inv.client_id = cl.client_id        -- Joining on the client_id column in both tables
where
    invoice_date >= '2019-07-01'        -- Filtering records where invoice_date is on or after '2019-07-01'
group by
    cl.state,                           -- Grouping the results by state
    cl.city                             -- Grouping the results by city
order by
    total_sales desc;                   -- Ordering the results by total_sales in descending order

*/

/*
select
    cl.state,                           -- Step 5: Selecting the state from the clients table
    cl.city,                            -- Step 5: Selecting the city from the clients table
    sum(invoice_total) as total_sales   -- Step 5: Calculating the sum of invoice_total and aliasing it as total_sales
from
    invoices as inv                     -- Step 1: From the invoices table aliased as inv
join
    clients as cl                       -- Step 2: Joining the clients table aliased as cl
on
    inv.client_id = cl.client_id        -- Step 2: Joining on the client_id column in both tables
where
    invoice_date >= '2019-07-01'        -- Step 3: Filtering records where invoice_date is on or after '2019-07-01'
group by
    cl.state,                           -- Step 4: Grouping the results by state
    cl.city                             -- Step 4: Grouping the results by city
order by
    total_sales desc;                   -- Step 6: Ordering the results by total_sales in descending order

*/


/*
-- запрос №1
select
	client_id, 
    invoice_id
from
	invoices
group by
	client_id, 
    invoice_id
order by 
	invoice_id;

*/

/* 
-- запрос №2
select
	client_id, 
    invoice_id
from
	invoices
group by
    invoice_id
order by 
	invoice_id;
*/    
/*
Запрос #1:
GROUP BY client_id, invoice_id: 
	Этот запрос группирует строки по сочетанию client_id и invoice_id.
	В результате каждая группа будет представлять уникальную комбинацию client_id и invoice_id. 
	Если в таблице нет дублирующихся записей с одинаковыми client_id и invoice_id, то этот запрос вернет все 
    строки из таблицы, так как каждая комбинация будет уникальной.

Запрос #2:
GROUP BY invoice_id: Этот запрос группирует строки только по invoice_id.
	В результате каждая группа будет представлять уникальный invoice_id. 
	Если invoice_id является уникальным для каждой строки (что часто бывает, так как это может быть первичный ключ), 
	то группировка по invoice_id также вернет все строки из таблицы, так как каждая группа будет уникальной.

Причина одинакового результата

В реальной таблице invoices:
- invoice_id вероятно уникален для каждой строки (как первичный ключ).
- Каждая запись в таблице имеет уникальное сочетание client_id и invoice_id.

Таким образом:
- В запросе #1 группировка по client_id, invoice_id не объединяет строки, так как каждая комбинация уникальна.
- В запросе #2 группировка по invoice_id не объединяет строки, так как каждый invoice_id уникален.
*/

/*
select
	client_id,
    count(client_id) ,
    count(distinct client_id)
from
	invoices
group by
	client_id;
*/


 -- exercise 

-- Select payment date, payment amount, and payment method name
select
    payment_date,  														-- Column with the payment date
    sum(amount),   														-- Sum of all payments for each group
    payment_methods.payment_method_name 								-- Name of the payment method
from
    payments  															-- Payments table
left join
    payment_methods  													-- Payment methods table
    on payments.payment_method_id = payment_methods.payment_method_id  	-- Join tables by payment method ID
group by
    payment_methods.payment_method_id,  								-- Group by payment method ID
    payment_date  														-- Also group by payment date
order by
    payment_date;  														-- Order the results by payment date


/*
When a value for 2019-01-08 is duplicated, it can occur because the same date has different 
values for different payment methods. In this query, values can be duplicated if the payments 
table contains multiple records with different payment_method_id for the same date.

Different payment methods: 
	If there are several different payment methods for the date 2019-01-08, 
    the query will create a separate row for each payment method. For example, 
    if both credit cards and cash were used on the same day, there will be two 
    values for that date, one for each payment method.

*/
  
    