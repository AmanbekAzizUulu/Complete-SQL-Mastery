drop procedure if exists get_payments;

DELIMITER $$
create procedure get_payments(
	in client_id tinyint,
    in payment_method_id int
)
begin
	create temporary table if not exists temp_payments as
	select
		*
	from
		payments as p
	where
		p.client_id = client_id and
        p.payment_method_id = payment_method_id;
        
	-- check if temporary table has any rows
    if (
		select 
			count(*) 
		from 
			temp_payments
		) = 0 
		then
        -- if no rows, select default values
			select 
				0 as payment_id, 
				client_id as client_id, 
				0 as invoice_id, 
				null as payment_date, 
				0 as amount, 
				payment_method_id as payment_method_id
			from
				payments;
    else
        -- if rows exist, return them
        select 
			* 
		from 
			temp_payments;
    end if;

    -- Drop the temporary table
    drop temporary table if exists temp_payments;
end$$
DELIMITER ;
