drop procedure if exists get_risk_factor;

delimiter $$

create procedure get_risk_factor()

begin
	declare risk_factor decimal(9, 2) default 0;
    declare invoices_total decimal(9, 2);
    declare invoices_count int;
    
    select 
		count(*),
        sum(invoice_total)
	into
		invoices_total,
        invoices_count
	from
		invoices as inv;
        
	set risk_factor = invoices_total/invoices_count * 5;
    select risk_factor;
    
	
end $$

delimiter ;


-- 1. Local Variable: 
-- 	This term is used to describe a variable that is declared and used within a specific block of code, such as a stored procedure, function, or trigger. 
--  Its scope is limited to that block of code.

--    - Synonyms:
--      - Block-level variable
--      - Procedure-level variable
--      - Function-local variable

-- 2. Session Variable: 
-- 	This term is used to describe a user-defined variable in SQL that is specific to a database session. 
--  It is available throughout the session until the session ends or the variable is explicitly reset.

--    - Synonyms:
--      - Session-scoped variable
--      - User-defined variable (when referring to session-specific variables)
--      - Session-specific variable
