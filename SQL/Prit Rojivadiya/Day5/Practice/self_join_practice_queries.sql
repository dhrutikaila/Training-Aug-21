use Demo

CREATE TABLE EmployeeManager
(
EmpID int PRIMARY KEY,
EmpName varchar(30) not null,
ManagerID int
)

INSERT INTO EmployeeManager VALUES (1,'A',NULL),
									(2,'B',1),
									(3,'C',1),
									(4,'D',1),
									(5,'E',2),
									(6,'F',2),
									(7,'G',2)



SELECT * FROM EmployeeManager

SELECT * 
FROM EmployeeManager as emp
	INNER JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID


SELECT emp.EmpName as 'Emp',mgr.EmpName as 'Manager'
FROM EmployeeManager as emp
	JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID


SELECT *
FROM EmployeeManager as emp
	LEFT OUTER JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID


SELECT *
FROM EmployeeManager as emp
	RIGHT OUTER JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID


SELECT emp.EmpName as 'Emp',mgr.EmpName as 'Manager'
FROM EmployeeManager as emp
	LEFT OUTER JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID


SELECT emp.EmpName as 'Emp',mgr.EmpName as 'Manager'
FROM EmployeeManager as emp
	RIGHT OUTER JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID


-- Name of employees who are managers
SELECT DISTINCT mgr.EmpName as 'Manager'
FROM EmployeeManager as emp
	LEFT OUTER JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID
	WHERE mgr.EmpName is not null


-- Name of employees who are not managers
SELECT DISTINCT mgr.EmpName as 'Employee'
FROM EmployeeManager as emp
	RIGHT OUTER JOIN EmployeeManager as mgr ON emp.ManagerID = mgr.EmpID
	WHERE Emp.EmpName is null