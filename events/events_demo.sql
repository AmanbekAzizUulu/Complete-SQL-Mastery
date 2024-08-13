drop event if exists yearly_delete_stale_audit_rows;

delimiter $$
-- Sets a new delimiter for commands (in this case, $$), since the event contains multiple SQL statements, and the standard delimiter `;` could cause issues.

create event yearly_delete_stale_audit_rows
-- Creates an event named yearly_delete_stale_audit_rows.

on schedule
	-- at '2024-09-01'		-- (Optional) This line, if uncommented, could schedule the event to start at a specific date and time.
	-- every 1 hour
    every 1 day starts '2024-08-14' ends '2024-08-16'
    -- Schedules the event to execute every day, starting from August 14, 2024, and ending on August 16, 2024.

do begin
-- Begins the block of SQL statements that will be executed when the event fires.

	delete from
		payments_audit
	-- Specifies the payments_audit table as the target for the delete operation.

	where
		action_date < now() - interval 1 day;
	-- Deletes records from the payments_audit table where the action_date is older than 1 day from the current time (now()).

end $$
-- Ends the block of SQL statements for the event.

delimiter ;
-- Restores the standard command delimiter `;`.


-- for more < https://dev.mysql.com/doc/refman/8.4/en/create-event.html >