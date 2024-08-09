use sql_store;
-- CURDATE()
-- Returns the current date as a value in 'YYYY-MM-DD' or YYYYMMDD format, depending on whether the function is used in string or numeric context.
set @current_date = (
	select curdate()
);

-- CURTIME([fsp])
-- Returns the current time as a value in 'hh:mm:ss' or hhmmss format, depending on whether the function is used in string or numeric context. The value is expressed in the session time zone.
-- If the fsp argument is given to specify a fractional seconds precision from 0 to 6, the return value includes a fractional seconds part of that many digits.
set @current_time = (
	select curtime()
);


-- NOW([fsp])
-- Returns the current date and time as a value in 'YYYY-MM-DD hh:mm:ss' or YYYYMMDDhhmmss format, depending on whether the function is used in string or numeric context. The value is expressed in the session time zone.
-- If the fsp argument is given to specify a fractional seconds precision from 0 to 6, the return value includes a fractional seconds part of that many digits.
set @current_date_and_time = (
	select now()
);

-- YEAR(date)
-- Returns the year for date, in the range 1000 to 9999, or 0 for the “zero” date.Returns NULL if date is NULL.
set @current_year = (
	select year(now())
);

-- MONTH(date)
-- Returns the month for date, in the range 1 to 12 for January to December, or 0 for dates such as '0000-00-00' or '2008-00-00' that have a zero month part. Returns NULL if date is NULL.
set @current_month = (
	select month(now())
);


-- DAY(date)	Synonym for DAYOFMONTH()
-- DAYOFMONTH(date)
-- Returns the day of the month for date, in the range 1 to 31, or 0 for dates such as '0000-00-00' or '2008-00-00' that have a zero day part. Returns NULL if date is NULL.
set @current_day = (
	select day(now())
);


-- HOUR(time)
-- Returns the hour for time. The range of the return value is 0 to 23 for time-of-day values. However, the range of TIME values actually is much larger, so HOUR can return values greater than 23. Returns NULL if time is NULL.
set @current_hour = (
	select hour(now())
);

-- MINUTE(time)
-- Returns the minute for time, in the range 0 to 59, or NULL if time is NULL.
set @current_minute = (
	select minute(now())
);

-- SECOND(time)
-- Returns the second for time, in the range 0 to 59, or NULL if time is NULL.
set @current_second = (
	select second(now())
);

-- DAYNAME(date)
-- Returns the name of the weekday for date. The language used for the name is controlled by the value of the lc_time_names system variable (see Section 12.16, “MySQL Server Locale Support”). Returns NULL if date is NULL.
set @day_name = (
	select dayname(now())
);


-- MONTHNAME(date)
-- Returns the full name of the month for date. The language used for the name is controlled by the value of the lc_time_names system variable (Section 12.16, “MySQL Server Locale Support”). Returns NULL if date is NULL.
set @month_name = (
	select monthname(now())
);


-- MONTHNAME(date)
-- Returns the full name of the month for date. The language used for the name is controlled by the value of the lc_time_names system variable (Section 12.16, “MySQL Server Locale Support”). Returns NULL if date is NULL.


-- EXTRACT(unit FROM date)
-- The EXTRACT() function uses the same kinds of unit specifiers as DATE_ADD() or DATE_SUB(), but extracts parts from the date rather than performing date arithmetic. For information on the unit argument, see Temporal Intervals. Returns NULL if date is NULL.
set @extracted_year = (
	select extract(year from now())
);

set @extracted_year_month = (
	select extract(year_month from now())
);

set @extracted_day_minute = (
	select extract(day_minute from now())
);

set @extracted_microsecond = (
	select extract(microsecond from now())
);



-- select 
-- 	@current_date as 'current date',
-- 	@current_time as 'current time',
--     @current_date_and_time as 'current date and time',
-- 	@current_year as 'current year',
--     @current_month as 'current month',
--     @current_day as 'current day',
--     @current_hour as 'current hour',
--     @current_minute as 'current minute',
--     @current_second as 'current second',
--     @day_name as 'current day\'s name',
--     @month_name as 'current month\'s name',
--     @extracted_year,
--     @extracted_year_month,
--     @extracted_day_minute,
--     @extracted_microsecond;
    
    

-- exercise
select
	*
from
	orders
where
	order_date >= now();
	

