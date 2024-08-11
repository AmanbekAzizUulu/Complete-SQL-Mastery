delimiter $$
create procedure get_all_clients()

begin
	select
		*
	from
		clients;
end $$

delimiter ;