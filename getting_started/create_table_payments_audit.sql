use sql_invoicing;

drop table if exists payments_audit;

create table payments_audit(
	audit_id 				int 	auto_increment primary key not null,
	client_id 			int 							   not null,
    payment_date 		date    						   not null,
    amount 				decimal( 9, 2) 					   not null,
    action_type 		varchar(50) 					   not null,
    action_date 		datetime 						   not null
);
