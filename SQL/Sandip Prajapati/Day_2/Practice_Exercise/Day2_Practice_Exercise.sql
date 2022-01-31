---------------------DAY-2---------------------
--------PRACTICE -EXERCISE-1-------------------
USE SANDY
--------SELECT-------------
SELECT * FROM Employees_1;

SELECT EmployeeID,Email,JobId FROM Employees_1 ;

SELECT ManagerID = '100' FROM Employees_1;
SELECT '100' AS ManagerID FROM Employees_1;
--NOT AN ANSWER WHICH REQUIRE
SELECT ManagerID'100' FROM Employees_1;

--LITERALS + coNCATETION
SELECT 'FirstName: '+ FirstName +' LastName: ' + LastName FROM Employees_1 ;

--ARITHMETIC
SELECT improve_salary = Salary *10 FROM Employees_1;
SELECT Salary *2 FROM Employees_1;

--WHERE
SELECT * FROM Employees_1
WHERE JobId = 'IT_PROG' ;

--LOGICAL-AND-COMPARISON-OPERATOR
SELECT * FROM Employees_1
WHERE Salary >20000;

SELECT * FROM Employees_1
WHERE ManagerId ='102' or JobId = 'AD_VP';

SELECT * FROM Employees_1
WHERE EmployeeId BETWEEN 100 AND 111 ;

SELECT * FROM Employees_1
WHERE Salary NOT BETWEEN 10000 AND 15000 ;

--IN-NOT-IN
SELECT * FROM Employees_1
WHERE  JobId IN ('FI_ACCOUNT','PU_CLERK');

SELECT * FROM Employees_1
WHERE  JobId NOT IN ('FI_ACCOUNT','PU_CLERK');

--LIKE
SELECT * FROM Employees_1
WHERE JobId LIKE 'AD%';

--IS-NULL
SELECT * FROM Employees_1
WHERE CommissionPct is NULL;

--ORDER-BY
SELECT * FROM Employees_1
ORDER BY FirstName DESC;

SELECT * FROM Employees_1
ORDER BY FirstName;

--TOP
SELECT TOP 15 * FROM Employees_1;

--DISTINCT
SELECT DISTINCT JobId FROM Employees_1;

--UNION-EXCEPT-INTERSECT
SELECT FirstName FROM Employees_1
UNION
SELECT LastName FROM Employees_1;

SELECT ManagerId FROM Employees_1
EXCEPT
SELECT DepartmentId FROM Employees_1;

SELECT ManagerId FROM Employees_1
INTERSECT
SELECT DepartmentID FROM Employees_1;

--Derived-Table
SELECT Salary FROM (
SELECT DENSE_RANK () OVER (ORDER BY Salary DESC)'D_Rank', FirstName,LastName,Salary From Employees_1)
SalaryRank
WHERE D_RANK = 2;


--join
SELECT FirstName,LastName,JobId FROM Employees_1 
INNER JOIN
(SELECT DepartmentID,DepartmentName FROM Departments_1)
AS dept ON dept.DepartmentID = Employees_1.DepartmentID

--CTE
WITH Emp_CTE(EmployeeId,FirstName,LastName,Salary,JobId)
AS
(
SELECT EmployeeID,FirstName,LastName,Salary,JobId
FROM Employees_1
)
SELECT * FROM Emp_CTE
--------INSERT-------------
INSERT INTO Employees_1 (EmployeeID,FirstName,LastName, Email,PhoneNumber,HireDate,JobId,Salary, CommissionPct, ManagerID, DepartmentID)
VALUES ('207','SANDIP','PRAJAPATI','san@','615.456.8901','2021-07-16','Developer','50000.00','0.00','0','100');

--------UPDATE-------------
UPDATE Employees_1
SET LastName = 'SUNDY';

UPDATE Employees_1
SET FirstName = 'TIGER', HireDate = '2021-07-16' ;

UPDATE Employees_1
SET FirstName = 'HARSH' , LastName = 'PRAJAPATI'
WHERE Email = 'SKING'; 

UPDATE Employees_1
SET Salary = Salary * 2;

--OBSERVATION
DECLARE @NewCommissionPct DECIMAL= '02.00';
UPDATE Employees_1
SET CommissionPct += @NewCommissionPct 
WHERE ManagerID = '100';

