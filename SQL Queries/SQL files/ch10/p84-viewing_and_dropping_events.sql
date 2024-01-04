SHOW EVENTS;
SHOW EVENTS LIKE 'yearly%';

-- enable/disable an event.
ALTER EVENT yearly_delete_stale_audit_rows ENABLE;
ALTER EVENT yearly_delete_stale_audit_rows DISABLE;

DELIMITER $$

-- update the event.
ALTER EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
    AT '2029-05-01 10:00:00'
DO BEGIN
    DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ;

DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;

Error Code: 1589. Event execution time is in the past and ON COMPLETION NOT PRESERVE is set. The event was not changed. Specify a time in the future.


