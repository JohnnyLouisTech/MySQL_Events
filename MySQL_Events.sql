-- CREATE EVENTS -- 

DELIMITER $$

CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE 
	-- AT '2020-08-22'-- 
    EVERY 1 YEAR STARTS '2022-08-22' ENDS '2028-08-22'
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ; 