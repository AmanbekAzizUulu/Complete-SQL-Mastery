-- formating dates and times 

set @date_format = (
	select date_format(now(), '%M %D %Y')
);

set @time_format = (
	select time_format(now(), '%h : %i %p')
);

select 
	@date_format,
	@time_format;
    
    
-- see mysql documentation to more information abaout format functions
-- https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html

