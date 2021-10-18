-- Create view of employees table containing columns EmployeeID,FirstName,LastName,Salary,JobId and perform insert,update,delete operations.

CREATE VIEW employeesview 
AS SELECT EmployeeID,FirstName,LastName,Salary,JobId FROM employees 
WHERE EmployeeID <= 110;

INSERT INTO employeesview(EmployeeID,FirstName,LastName,Salary,JobId) VALUES(1,'Steven','King',8000,'AD_PRES');

UPDATE employeesview SET Salary = 15000 WHERE EmployeeID = 1;

DELETE FROM employeesview WHERE EmployeeID = 1;

-- Create view of employees and departments table containing columns EmployeeID,FirstName,LastName,JobId, DepartmentName
 
CREATE VIEW empview2 
AS SELECT e.EmployeeID,e.FirstName,e.LastName,e.JobId,d.DepartmentName FROM employees e
INNER JOIN departments d ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID < 110;

-- BATCH

-- IF..ELSE

DELIMITER //

CREATE PROCEDURE income( salary INT )

BEGIN

   DECLARE income varchar(20);

   IF salary <= 4000 THEN
      SET income = 'Low Income';

   ELSEIF salary > 4000 AND salary <= 7000 THEN
      SET income = 'Avg Income';

   ELSE
      SET income = 'High Income';

   END IF;

   SELECT income;

END; //

DELIMITER ;

-- CASE

UPDATE employees SET Salary = CASE DepartmentID 
				WHEN 40 THEN Salary=Salary+(Salary*0.25) 
				WHEN 90 THEN Salary=Salary+(Salary*0.15) 
				WHEN 110 THEN Salary=Salary+(Salary*0.10) 
				ELSE Salary 
			      END WHERE DepartmentID IN(40,90,110);


-- WHILE

DELIMITER &&
CREATE PROCEDURE dowhileloop()
BEGIN
  DECLARE v1 INT DEFAULT 5;

  WHILE v1 > 0 DO
    
    SET v1 = v1 - 1;
    SELECT v1;
  END WHILE;
END &&
DELIMITER ;

