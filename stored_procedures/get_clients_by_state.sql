drop procedure if exists get_clients_by_state;

delimiter $$
create procedure get_clients_by_state (
		in state char(2)
    )
begin
	select
		*
	from
		clients as cl
	where
		cl.state = state;
end $$

delimiter ;