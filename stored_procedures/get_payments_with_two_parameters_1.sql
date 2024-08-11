drop procedure if exists get_payments_1;

delimiter $$
create procedure get_payments_1(
	in client_id int,
    in payment_method_id tinyint
)
begin
	select
		*
	from
		payments as p
	where
		p.client_id = ifnull(client_id, p.client_id) and
        p.payment_method_id = ifnull(payment_method_id, p.payment_method_id);
end