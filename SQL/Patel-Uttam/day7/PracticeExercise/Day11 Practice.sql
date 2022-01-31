USE [Day11 (views and CTE)]

-- Practice Exercise


-- CTE (Common Table Expression) : Common Table Expression are temporary result set that you can refrence within SELECT ,UPDATE ,DELETE , INSERT Statement.
								-- CTE is also be used in view.


-- E.X

	WITH CTE1(Department ,NoofEmployee) AS
	(SELECT DepartmentID , COUNT(EmployeeID)
	FROM Employees
	GROUP BY DepartmentID
	)SELECT COUNT(Department) 'No of Department' , AVG(NoofEmployee) 'Average employee per department' FROM CTE1



	WITH CTE2(Department , NoofEmployee) AS
	(SELECT DepartmentName , COUNT(EmployeeID)
	FROM Employees  
	JOIN Departments  
	ON Departments.DepartmentID = Employees.DepartmentID
	GROUP BY DepartmentName)
	SELECT Department , NoofEmployee 'Average employee per department' FROM CTE2






-- Views : Views are simply a virtual tables consisting of different columns from one or more tables.
		-- Views are not same a table , views are store in database as query object
		-- To insure the security of data view , restrict the some access and modification.
		-- updating column of view is basically reflect in table from where view has take it.
		-- View does not support updating  two column of different table in singlw query.
		-- View does not allow to update derived columns.


-- View-1
-------------------------------------------------------------------------------
-- view1 create
-- Create view of employee table

CREATE VIEW view1 AS
SELECT * FROM Employees

-- insert data
INSERT INTO view1
	SELECT 21,'Uttam','Patel','uttam@123',8425364525,'1987-07-29','PU_MAN',1850,0.15,101,90;

SELECT * FROM view1


-- adding CHECK OPTION
ALTER VIEW view1 AS
	SELECT * FROM Employees
	WHERE JobId = 'PU_CLERK'
	WITH CHECK OPTION


-- insert data with CHECK OPTION
INSERT INTO view1
	SELECT 22,'Uttam','Patel','uttam@123',8425364525,'1987-07-29','PU_MAN',1850,0.15,101,90;
--give error (we try to insert 'PU_MAN' in JobId ,  if we insert 'PU_CLERK' then it not give error.)

INSERT INTO view1
	SELECT 22,'Uttam','Patel','uttam@345',8425364525,'1987-07-29','PU_CLERK',1850,0.15,101,90;

SELECT * FROM view1


UPDATE view1 SET FirstName = 'Kunj' WHERE EmployeeID = 117

-------------------------------------------------------------------------------


-- View-2
-------------------------------------------------------------------------------
-- view2 create
-- Create view of employee table with encryption

CREATE VIEW view2 WITH ENCRYPTION AS
SELECT TOP 20 EmployeeID , FirstName , LastName , JobId FROM Employees

-- insert data 

INSERT INTO view2
	SELECT 22,'Uttam','Patel','PU_MAN';

-------------------------------------------------------------------------------


-- View-3
-------------------------------------------------------------------------------
-- view3 create
-- Create view consist columns from Employees and Departments.

CREATE VIEW view3 AS
SELECT TOP 30 e.EmployeeID , e.FirstName , d.DepartmentID,d.DepartmentName FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID


-- alter view (To add LastName)

ALTER VIEW view3 AS 
SELECT TOP 30 e.EmployeeID , e.FirstName , e.LastName , d.DepartmentID,d.DepartmentName FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID



-- updating view3 (In View3 departmentID column is From departments table.)

UPDATE view3 SET DepartmentID = 90 , DepartmentName = 'IT SUPPORT' WHERE EmployeeID = 109
-- give error (DepartmentID is Primary Key in Departments table)


-- updating Firstname and LastName in one query

UPDATE view3 SET FirstName = 'Steven' , LastName = 'King' WHERE EmployeeID = 101

-------------------------------------------------------------------------------


-- View-4
-------------------------------------------------------------------------------
-- view4 create  

CREATE VIEW view4 AS
SELECT TOP 30 e.EmployeeID , e.FirstName , e.DepartmentID,d.DepartmentName FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID



-- updating view4 (In View4 DepartmentID Column is From Employees Table)
UPDATE view4 SET DepartmentID = 90 WHERE EmployeeID = 109
-- This query does no give error



-- updating DepartmentName and DepartmentID in single query
UPDATE view4 SET DepartmentID = 90 , DepartmentName = 'IT Support'  WHERE EmployeeID = 109
-- give error (DepartmentID in view is column of Employees table & 
--					DepartmentName in view is from Departments table)




--alter f.name by FullName in view4
ALTER VIEW view4 AS 
SELECT TOP 30 e.EmployeeID , (e.FirstName+' '+e.LastName) 'FullName' , e.DepartmentID,d.DepartmentName FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID

SELECT * FROM view4


-- updating FullName 

UPDATE view4 SET FullName = 'Uttam Patel' WHERE EmployeeID = 22
-- give error Fullname is calculated column
-------------------------------------------------------------------------------
