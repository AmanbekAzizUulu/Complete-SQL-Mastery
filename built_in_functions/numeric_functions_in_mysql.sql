set @rounded_number = round(5.7345891, 5);
set @truncated_number = truncate(5.349545, 2);
set @ceiled_number = ceiling(5.1); 
set @abs_number = abs(-10);
set @random_number = rand();

-- select @rounded_number as rounded_number;
-- select @truncated_number as truncated_number;
-- select @ceiled_number as ceiled_number;
-- select @abs_number as absolute_number;
-- select @random_number as random_number_between_0_and_1;

-- see mysql documentation for more numeric functions
-- https://dev.mysql.com/doc/refman/8.4/en/mathematical-functions.html#function_abs