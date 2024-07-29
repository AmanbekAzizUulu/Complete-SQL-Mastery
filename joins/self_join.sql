-- Self Joins

use sql_hr;

select 
	employees.employee_id as 'ID сотрудника',
	employees.first_name as 'имя сотрудника',
	employees.last_name as 'фамилия сотрудника',
	
    managers.employee_id as 'ID менеджера',
    managers.first_name as 'имя менеджера',
    managers.last_name as 'фамилия менеджера'
from 
	employees
join 
	employees as managers
	on
		employees.reports_to = managers.employee_id
order by
	employees.employee_id;