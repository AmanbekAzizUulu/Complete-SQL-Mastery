drop procedure if exists get_invoices_by_client_id_2;

delimiter $$
create procedure get_invoices_by_client_id_2(
	in client_id int
)
begin
CREATE TEMPORARY TABLE IF NOT EXISTS temp_invoices AS
    SELECT
        *
    FROM
        invoices AS inv
    WHERE
        inv.client_id = client_id;

    -- Check if temporary table has any rows
    IF (SELECT COUNT(*) FROM temp_invoices) = 0 THEN
        -- If no rows, select default values
        SELECT 
            0 AS invoice_id, 
            'No Invoice' AS invoice_number, 
            client_id AS client_id, 
            0.00 AS invoice_total, 
            0.00 AS payment_total, 
            0.00 AS balance, 
            NULL AS invoice_date, 
            NULL AS due_date, 
            NULL AS payment_date;
    ELSE
        -- If rows exist, return them
        SELECT * FROM temp_invoices;
    END IF;

    -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS temp_invoices;
end $$
delimiter ;