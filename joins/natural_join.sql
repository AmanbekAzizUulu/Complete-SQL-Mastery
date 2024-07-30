use sql_store;

-- using natural join

select 
	*
from
	orders as o
natural join
	customers as c;
    
-- natural joins --

-- автоматически соединяет две таблицы по столбцам с одинаковыми именами и типами данных

-- natural joins are really easy to code, but they can be a little dangerous 
-- because we are letting the database engine, figure out or guess the join; 
-- we don't have control over it;
-- for this very reason natural joins can produce
-- unexpected results, and that's why I discourage you to use them 