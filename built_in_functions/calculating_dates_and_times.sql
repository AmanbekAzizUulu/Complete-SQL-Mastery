-- calculating dates and times 

select 
	date_add(now(), interval -1 year) as 'current_year - 1',
	date_add(now(), interval 1 year) as 'current_year + 1',
    datediff('2024-01-01', now()),
	datediff( now(), '2024-01-01'),
    time_to_sec(now()) - time_to_sec('04:26');	-- TIME_TO_SEC(time)
												-- Returns the time argument, converted to seconds. Returns NULL if time is NULL.
    
-- DATE_ADD() используется для добавления интервала к дате или времени.
-- DATE_SUB() используется для вычитания интервала из даты или времени.

-- Функция DATEDIFF() используется для вычисления разницы между двумя датами в днях.

