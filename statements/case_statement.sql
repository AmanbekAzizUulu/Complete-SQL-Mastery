use sql_store;

/*
-- using case statement
select
	order_id,
    case
		when 
			year(order_date) = year(now()) then 'active'
		when 
			year(order_date) < year(now()) then 'archived'
        when
			year(order_date) = year(now() - 1) then 'last year'
		else
			'future order'
	end as order_status
from
	orders;

*/

-- exercise
-- select the concatenated full name of the customer and the points, then categorize based on points
select
    concat(first_name, ' ', last_name) as 'customer\'s full name',  -- combine first_name and last_name into a full name
    points,  														-- select the points column to show the customer's points
    case  															-- begin the CASE expression to categorize customers
        when 
			points > 3000 then 'gold'  								-- if points are greater than 3000, categorize as 'gold'
        when 
			points between 2000 and 3000 then 'silver'  			-- if points are between 2000 and 3000, categorize as 'silver'
        when 
			points < 2000 then 'bronze'  							-- if points are less than 2000, categorize as 'bronze'
        else 'not assigned yet'  									-- if none of the above conditions are met, assign 'not assigned yet'
    end as category  												-- end of CASE expression, and label the result column as 'category'
from
    customers;  													-- specify the 'customers' table as the source of data
