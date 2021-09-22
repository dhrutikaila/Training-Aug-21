-- Stored Procedure with IN Parameter. This procedure (emp_details) takes employee id as input and returns the details of that employee.

DELIMITER && 
CREATE PROCEDURE emp_details(IN ID INT)
BEGIN
	SELECT * FROM employee WHERE EMPLOYEE_ID = ID;
END &&
DELIMITER ;

CALL emp_details(5);



-- Stored Procedure with OUT Parameter.This procedure (topsalary) takes managerid as input and returns the top salary of that department.

DELIMITER &&
CREATE PROCEDURE lmn(OUT top NUMERIC,IN id INT)
BEGIN

	SELECT MAX(Salary) INTO top FROM employee WHERE MANAGER_ID = id;

END &&
DELIMITER ;

CALL lmn(@top,5);
SELECT @top;


-- Stored Procedure with INOUT Parameter.This procedure (avgpercentage) returns average percentage of a city id provided as input.

DELIMITER &&  
CREATE PROCEDURE avgpercentage (INOUT abc int)  
BEGIN 
    SELECT AVG(percentage) INTO abc FROM school WHERE city = abc;   
END &&  
DELIMITER ;  

SET @a  = 2;
CALL avgpercentage(@a);
SELECT @a;

