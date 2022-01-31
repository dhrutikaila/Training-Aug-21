------------DAY-6------------
-----SUBQUERY-----
--using select
SELECT FirstName,Salary,(SELECT DepartmentName
FROM Departments AS DEP WHERE DEP.DepartmentID = EMP.DepartmentID)
FROM Employees AS EMP

--using in AND not in
SELECT FirstName,LastName,DepartmentID FROM Employees
WHERE DepartmentID IN(SELECT DepartmentID FROM Departments
WHERE DepartmentID>100)

SELECT FirstName,LastName,DepartmentID FROM Employees
WHERE DepartmentID NOT IN(SELECT DepartmentID FROM Departments
WHERE DepartmentID>100)

--using exists
SELECT EmployeeID,FirstName,LastName,DepartmentID FROM Employees
WHERE EXISTS(SELECT DepartmentID FROM Departments 
WHERE DepartmentID  = Employees.DepartmentID AND DepartmentID>100 )

--NESTED QUERIES
SELECT MINSALARY,MAXSALARY FROM DBO.Jobs
WHERE JobId IN (SELECT EmployeeID FROM Employees
WHERE DepartmentID IN(SELECT DepartmentID FROM Departments))

--CORELATED QUERIRS
SELECT * FROM Employees AS EMP
WHERE Salary = (SELECT MAX(Salary) FROM Employees WHERE DepartmentID = EMP.DepartmentID)

--USING UPDATE
SELECT * FROM Employees
WHERE EmployeeID IN (SELECT JobId FROM Jobs)
UPDATE Employees
SET CommissionPct =CommissionPct+0.10
WHERE EmployeeID IN (SELECT JobId FROM Jobs)

--USINF ANY,ALL
SELECT FirstName,LastName,Salary,JobId FROM Employees
WHERE Salary > ANY(SELECT MAX(Salary) FROM Employees GROUP BY JobId )
SELECT MAX(Salary),JobId FROM Employees GROUP BY JobId;
SELECT FirstName,LastName,Salary,JobId FROM Employees
WHERE Salary < All(SELECT MAX(Salary) FROM Employees GROUP BY JobId)

SELECT FirstName,LastName,Salary,JobId FROM Employees
WHERE Salary <> ANY(SELECT MAX(Salary) FROM Employees GROUP BY JobId )

SELECT FirstName,LastName,Salary,JobId FROM Employees
WHERE Salary <> All(SELECT MAX(Salary) FROM Employees GROUP BY JobId )

SELECT FirstName,LastName,Salary,JobId FROM Employees
WHERE Salary NOT IN(SELECT MAX(Salary) FROM Employees GROUP BY JobId )

SELECT FirstName,LastName,Salary,JobId FROM Employees
WHERE NOT EXISTS(SELECT MAX(Salary) FROM Employees GROUP BY JobId );

SELECT FirstName,LastName,Salary,JobId FROM Employees
WHERE EXISTS(SELECT MAX(Salary) FROM Employees GROUP BY JobId );

-----------VIEWS-----------
--CREATE VIEW
CREATE VIEW EMPINFO AS
SELECT EMP.EmployeeID,(EMP.FirstName+' '+EMP.LastName) FullName,EMP.Email,EMP.Salary,
J.MAXSALARY,j.MINSALARY,INC.INCEPTIVE_SALARY,DEP.DepartmentName
FROM(((( Employees AS EMP JOIN Jobs AS J ON EMP.EmployeeID = J.JobId)
JOIN INCEPTIVE_TABLE AS INC ON EMP.EmployeeID = INC.EmployeeID)
JOIN Departments AS DEP ON EMP.DepartmentID = DEP.DepartmentID));

--CREATE VIEW WITH ENCRYPTION
CREATE VIEW EMPINFO
WITH ENCRYPTION
AS
SELECT EMP.EmployeeID,(EMP.FirstName+' '+EMP.LastName) FullName,EMP.Email,EMP.Salary,
J.MAXSALARY,j.MINSALARY,INC.INCEPTIVE_SALARY,DEP.DepartmentName
FROM(((( Employees AS EMP JOIN Jobs AS J ON EMP.EmployeeID = J.JobId)
JOIN INCEPTIVE_TABLE AS INC ON EMP.EmployeeID = INC.EmployeeID)
JOIN Departments AS DEP ON EMP.DepartmentID = DEP.DepartmentID));

--VIEWS VIEW
CREATE VIEW DEM
AS
SELECT EmployeeID,FullName,Email FROM EMPINFO;

CREATE VIEW DUMMY
AS
SELECT * FROM Employees
--SELECT VIEW
SELECT * FROM EMPINFO

CREATE VIEW DUMMY
AS
SELECT * FROM Employees

SELECT * FROM DUMMY

--ALTER VIEW
ALTER VIEW EMPINFO
AS
DROP COLUMN MAXSALARY

--CAN NOT TRUNCATE
TRUNCATE VIEW EMPINFO

--DELETE ROW IN VIEW
DELETE FROM DUMMY 
WHERE EmployeeID = '101'

DELETE FROM DEM
WHERE EmployeeID = '201'
--DROP VIEW
DROP VIEW EMPINFO

--NOT RUN
--CREATE AND REPLACE VIEW
CREATE OR REPLACE VIEW 'EMPINFO' AS
SELECT EMP.EmployeeID,(EMP.FirstName+' '+EMP.LastName) FullName,EMP.Email,
J.MAXSALARY,j.MINSALARY,INC.INCEPTIVE_SALARY,DEP.DepartmentName
FROM(((( Employees AS EMP JOIN Jobs AS J ON EMP.EmployeeID = J.JobId)
JOIN INCEPTIVE_TABLE AS INC ON EMP.EmployeeID = INC.EmployeeID)
JOIN Departments AS DEP ON EMP.DepartmentID = DEP.DepartmentID))
;
--NOT RUN
CREATE OR REPLACE VIEW EMPINFO AS
SELECT Salary FROM Employees
WHERE Salary > 3000

ALTER VIEW EMPINFO
ADD COLUMN DEPARTMENTID INT

ALTER TABLE EMPINFO
DROP COLUMN Salary

ALTER VIEW EMPINFO
DROP COLUMN Salary

--ALTER VIEW IT IS USED FOR ADD OR DELETE COLUMN
ALTER VIEW EMPINFO AS
SELECT EMP.EmployeeID,(EMP.FirstName+' '+EMP.LastName) FullName,EMP.Email,
J.MAXSALARY,j.MINSALARY,INC.INCEPTIVE_SALARY,DEP.DepartmentName
FROM(((( Employees AS EMP JOIN Jobs AS J ON EMP.EmployeeID = J.JobId)
JOIN INCEPTIVE_TABLE AS INC ON EMP.EmployeeID = INC.EmployeeID)
JOIN Departments AS DEP ON EMP.DepartmentID = DEP.DepartmentID))
;

ALTER VIEW EMPINFO AS
SELECT EMP.EmployeeID,(EMP.FirstName+' '+EMP.LastName) FullName,EMP.Email,EMP.Salary,
J.MAXSALARY,j.MINSALARY,INC.INCEPTIVE_SALARY,DEP.DepartmentName
FROM(((( Employees AS EMP JOIN Jobs AS J ON EMP.EmployeeID = J.JobId)
JOIN INCEPTIVE_TABLE AS INC ON EMP.EmployeeID = INC.EmployeeID)
JOIN Departments AS DEP ON EMP.DepartmentID = DEP.DepartmentID))
;

ALTER VIEW EMPINFO AS
SELECT DepartmentName FROM Departments

--NOT RUN
ALTER VIEW EMPINFO AS
SELECT EMP.EmployeeID,(EMP.FirstName+' '+EMP.LastName) FullName,EMP.Email,EMP.Salary,
J.MAXSALARY,j.MINSALARY,INC.INCEPTIVE_SALARY,DEP.DepartmentName
FROM(((( Employees AS EMP JOIN Jobs AS J ON EMP.EmployeeID = J.JobId)
JOIN INCEPTIVE_TABLE AS INC ON EMP.EmployeeID = INC.EmployeeID)
JOIN Departments AS DEP ON EMP.DepartmentID = DEP.DepartmentID))
UNION ALL
SELECT DepartmentName FROM Departments
WHERE DepartmentID IN (SELECT DepartmentID FROM Employees,Jobs WHERE EmployeeID = Jobs.JobId)

--NOT RUN
CREATE VIEW EMPINFO
AS
SELECT EMP.EmployeeID,(EMP.FirstName+' '+EMP.LastName) FullName,EMP.Email,EMP.Salary,
J.MAXSALARY,j.MINSALARY,INC.INCEPTIVE_SALARY,DEP.DepartmentName
FROM(((( Employees AS EMP JOIN Jobs AS J ON EMP.EmployeeID = J.JobId)
JOIN INCEPTIVE_TABLE AS INC ON EMP.EmployeeID = INC.EmployeeID)
JOIN Departments AS DEP ON EMP.DepartmentID = DEP.DepartmentID))
UNION ALL
SELECT DepartmentName FROM Departments
WHERE DepartmentID IN (SELECT DepartmentID FROM Employees,Jobs WHERE EmployeeID = Jobs.JobId)

