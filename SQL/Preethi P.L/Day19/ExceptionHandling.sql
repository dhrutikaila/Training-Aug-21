DELIMITER $$
CREATE PROCEDURE my_procedure(IN search_var VARCHAR(255))

BEGIN
DECLARE exit handler for SQLEXCEPTION
 BEGIN
  	GET DIAGNOSTICS CONDITION 1 
	@sqlstate = RETURNED_SQLSTATE, 
   	@errno = MYSQL_ERRNO, 
	@text = MESSAGE_TEXT;
  
	SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
  	SELECT @full_error;
 END;
SELECT * FROM fake_table WHERE id = search_var;
END$$
DELIMITER ;

CALL my_procedure('1234');
