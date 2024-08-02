-- Aggregate Functions
-- operate only on non-null values

use sql_invoicing;

/*
select
-- 	   max(invoice_total) as highest_invoice_total,
--     min(invoice_total) as lowest_invoice_total,
--    
-- 	   avg(invoice_total) as average_invoice_total,
--     
--     sum(invoice_total) as sum_invoice_total,
-- 		
--     count(invoice_total) as count_of_rows_of_invoice_total,
-- 	   count(payment_date) as count_of_payment_dates,			-- bcs aggregate functions include
-- 															    -- only non-null values
	
--     count(invoice_id) as total_rows_affected,
    
--     using aggregate functions with date data type
--     max(payment_date) as latest_payment_date,
--     min(payment_date) as earliest_payment_date,
--     avg(payment_date) as average_payment_date -- need to convert

	count(client_id) as non_unique_count_of_clients,
    count(distinct client_id) as unique_count_of_clients,
	sum(invoice_total * 1.1) as 'sum_invoice_total + 10%'
    
from
	invoices
where
	invoice_date > '2019-07-01';
*/

select
	'first half of 2019' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as what_we_expect
from
	invoices
where 
	invoice_date between '2019-01-01' and
						 '2019-06-30'
union

select
	'second half of 2019' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as what_we_expect
from
	invoices
where 
	invoice_date between '2019-07-01' and
						 '2019-12-31'
union

select
	'total' as date_range,
    sum(invoice_total) as total_sales,
    sum(payment_total) as total_payments,
    sum(invoice_total - payment_total) as what_we_expect
from
	invoices
where 
	invoice_date between '2019-01-01' and
						 '2019-12-31'
;

