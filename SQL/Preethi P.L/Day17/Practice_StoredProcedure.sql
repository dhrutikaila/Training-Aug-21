-- Stored Procedure with IN Parameter. This procedure (emp_details) takes employee id as input and returns the details of that employee.

DELIMITER && 
CREATE PROCEDURE emp_details(IN ID INT)
BEGIN
	SELECT * FROM employees WHERE EmployeeID = ID;
END &&
DELIMITER ;

CALL emp_details(100);


-- Stored Procedure with OUT Parameter.This procedure (topsalary) takes departmentid as input and returns the top salary of that department.

DELIMITER &&
CREATE PROCEDURE topsalary(OUT top NUMERIC,IN deptid INT)
BEGIN
	
	SELECT MAX(Salary) INTO top FROM employees WHERE DepartmentID = deptid;

END &&
DELIMITER ;

CALL topsalary(@top,80);
SELECT @top;


-- Stored Procedure with INOUT Parameter.This procedure (avg_salary) returns average salary of a department id provided as input.

DELIMITER &&  
CREATE PROCEDURE avg_salary (INOUT var1 NUMERIC)  
BEGIN  
    SELECT AVG(Salary) INTO var1 FROM employees WHERE DepartmentID = var1;   
END &&  
DELIMITER ;  

SET @x = 90;
CALL avg_salary(@x);
SELECT @x;

-- Stored Procedure for incrementing the salary of an employee whose salary < 3000. It takes id as input.

DELIMITER &&
CREATE PROCEDURE salary(IN x INT)
BEGIN
	IF (SELECT Salary FROM employees WHERE EmployeeID = x) < 3000 THEN 
		UPDATE employees SET Salary = Salary + 3000 WHERE EmployeeID = x;
    		SELECT x, Salary WHERE x = EmployeeID;
    	END IF;
	SELECT x, Salary FROM employees WHERE x = EmployeeID;

END &&
DELIMITER ;

SET @x = 100;
CALL salary(@x);

-- Displays all stored procedures

SHOW PROCEDURE STATUS WHERE db = 'training2';

