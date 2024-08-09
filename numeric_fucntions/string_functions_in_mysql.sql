-- String Functions
use sql_store;

-- LENGTH(str)
-- Returns the length of the string str, measured in bytes. A multibyte character counts as multiple bytes. This means that for a string containing five 2-byte characters, LENGTH() returns 10, whereas CHAR_LENGTH() returns 5. 
-- Returns NULL if str is NULL.
-- select length('String functions') as length_of_string;

-- UPPER(str)
-- Returns the string str with all characters changed to uppercase according to the current character set mapping, or NULL if str is NULL. The default character set is utf8mb4.
-- select upper('this text will be in upper-case') as upper_case;

-- LOWER(str)
-- Returns the string str with all characters changed to lowercase according to the current character set mapping, or NULL if str is NULL. The default character set is utf8mb4.	
-- select lower('THIS TEXT WILL BE IN LOWER-CASE') AS lower_case;

-- LTRIM(str)
-- Returns the string str with leading space characters removed. Returns NULL if str is NULL.
-- select ltrim('    whitespaces trimmed from left') as 'ltrim()'; 

-- RTRIM(str)
-- Returns the string str with trailing space characters removed.
-- select rtrim('whitespaces trimmed from right    ') as 'rtrim()'; 

-- TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr FROM] str)
-- Returns the string str with all remstr prefixes or suffixes removed. If none of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is assumed. remstr is optional and, if not specified, spaces are removed.
-- select trim('     spaces are removed     ') as 'trim()';

-- LEFT(str,len)
-- Returns the leftmost len characters from the string str, or NULL if any argument is NULL.
-- select left('Explanation!', 2) as 'left()';

-- RIGHT(str,len)
-- Returns the rightmost len characters from the string str, or NULL if any argument is NULL.
-- select right('Explanation!', 2) as 'right()';

-- SUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len), SUBSTRING(str FROM pos FOR len)
-- The forms without a len argument return a substring from string str starting at position pos. The forms with a len argument return a substring len characters long from string str, starting at position pos. The forms that use FROM are standard SQL syntax. It is also possible to use a negative value for pos. In this case, the beginning of the substring is pos characters from the end of the string, rather than the beginning. A negative value may be used for pos in any of the forms of this function. A value of 0 for pos returns an empty string.
-- For all forms of SUBSTRING(), the position of the first character in the string from which the substring is to be extracted is reckoned as 1.
-- select substring('Explanation' , 2) as 'substring()'
-- select substring('Explanation' , 2 , 4) as 'substring()'

-- LOCATE(substr,str), LOCATE(substr,str,pos)
-- The first syntax returns the position of the first occurrence of substring substr in string str. The second syntax returns the position of the first occurrence of substring substr in string str, starting at position pos. Returns 0 if substr is not in str. Returns NULL if any argument is NULL.
-- select locate('t','Explanation!');
-- select locate('!','Explanation!');
-- select locate('?','Explanation!');
-- select locate('an','Explanation!');

-- REPLACE(str,from_str,to_str)
-- Returns the string str with all occurrences of the string from_str replaced by the string to_str. REPLACE() performs a case-sensitive match when searching for
-- select replace('Explanation!', '!', '?') as 'replace_!_to_?';

-- CONCAT(str1,str2,...)
-- Returns the string that results from concatenating the arguments. May have one or more arguments. If all arguments are nonbinary strings, the result is a nonbinary string. If the arguments include any binary strings, the result is a binary string. A numeric argument is converted to its equivalent nonbinary string form.
-- CONCAT() returns NULL if any argument is NULL.
-- select concat('Expla','nation!') as 'concat: Expla + nation!';
-- select concat('first_name ', 'last_name') as 'full name';
-- select concat('Aibek', ' ', 'Dandaev') as 'full name';

select 
	concat(first_name, ' ', last_name) as 'client\'s full name'
from
	customers;
    
    
-- see mysql documentation for more build-in functions
-- https://dev.mysql.com/doc/refman/8.4/en/built-in-function-reference.html
-- https://dev.mysql.com/doc/refman/8.4/en/string-functions.html