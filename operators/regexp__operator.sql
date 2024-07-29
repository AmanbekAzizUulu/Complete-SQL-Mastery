/*
-- The REGEXP Operator (read desc)

-- without REGEXP operator


select 
	*
from
	customers
where 
	last_name like '%field%';
    

-- using REGEXP operator

select 
	*
from 
	customers
where 
	last_name regexp 'field|^mac|urgh$';

-- ^ beginnig of the expression
-- $ ending of the expression
-- | logical operator 'or'
--
-- [gim]field -> 1. gfield
-- 				 2. ifield
-- 				 3. mfield	
-- field[gim] -> 1. fieldg
-- 				 2. fieldi
-- 				 3. fieldm	

-- [a-e]field -> 1. afield
-- 				 2. bfield
-- 				 3. cfield
-- 				 4. dfield
-- 				 5. efield
-- field[a-e] -> 1. fielda
-- 				 2. fieldb
-- 				 3. fieldc
-- 				 4. fieldd
-- 				 5. fielde



select 
	*
from
	customers
where 
-- 	first_name regexp '^Elka$|^Ambur$';
-- 	last_name regexp 'ey$|on$';	
-- 	last_name regexp '^My|se';
	last_name regexp 'b[ru]';
    
*/