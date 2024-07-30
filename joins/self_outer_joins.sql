-- Self Outer Joins

use sql_hr;

-- select * from employees;

/*

-- this querry returns only that employees
-- wich have managers

select 
	empl.employee_id,
    empl.first_name as empl_first_name,
    empl.last_name as empl_last_name,
    
    mng.first_name as mng_first_name,
    mng.last_name as mng_last_name
from 
	employees as empl
join
	employees as mng
    on
		empl.reports_to = mng.employee_id;
*/

-- this querry returns all employees

select 
	empl.employee_id,
    empl.first_name as empl_first_name,
    empl.last_name as empl_last_name,
    
    mng.first_name as mng_first_name,
    mng.last_name as mng_last_name
from 
	employees as empl
left outer join
	employees as mng
    on
		empl.reports_to = mng.employee_id;