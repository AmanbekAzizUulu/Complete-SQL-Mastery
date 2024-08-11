drop procedure if exists get_all_invoices;

delimiter $$

create procedure get_all_invoices()
begin
	select
		*
	from
		invoices;
end $$

delimiter ;