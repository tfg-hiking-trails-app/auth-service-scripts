SET GLOBAL event_scheduler = ON;

DELIMITER //

CREATE EVENT deactivate_expired_tokens
ON SCHEDULE EVERY 1 HOUR
DO
  UPDATE RefreshToken
  SET active = FALSE
  WHERE expiration < NOW()
    AND active = TRUE;
//

DELIMITER ;