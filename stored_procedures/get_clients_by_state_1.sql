drop procedure if exists get_clients_by_state_1;

delimiter $$
create procedure get_clients_by_state_1(
	in state char(2)
)

begin
	-- assigning default value
	if state is null then
		set state = 'CA';
	end if;
    
    select
		*
	from
		clients as cl
	where
		cl.state = state;
end $$

delimiter ;
