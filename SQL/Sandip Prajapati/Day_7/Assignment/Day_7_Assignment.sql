-----------DAY-7-----------
USE SANDY
-------Assignment
--DAY-4 WITH CTE AND DERIVED TABLE
--Write a query to rank employees based on their salary for a month
--WITH CTE
WITH CTERank(RANK,FirstName,LastName,Salary)
AS
(SELECT RANK() OVER (ORDER BY Salary) AS RANK,FirstName,LastName,Salary FROM Employees)
SELECT * FROM CTERank;
--DERIVED TABLE
SELECT RANK,Salary FROM
(SELECT RANK() OVER (ORDER BY Salary) AS RANK,FirstName,LastName,Salary FROM Employees) AS CTERANK;

--Select 4th Highest salary from employee table using ranking function
--WITH CTE
WITH CTERANK4(RANKNo,FirstName,LastName,Salary )
AS
(SELECT DENSE_RANK() OVER (ORDER BY Salary)RANKNo,FirstName,LastName,Salary FROM Employees)
SELECT * FROM CTERANK4
WHERE RANKNo = '4';

--DERIVED TABLE
SELECT Salary FROM
(SELECT DENSE_RANK() OVER (ORDER BY Salary)RANKNo,FirstName,LastName,Salary FROM Employees) As Emp
WHERE Emp.RANKNo='4'
--Get department, total salary with respect to a department from employee table.
--WITH CTE
WITH CTESALARY(DID,DNAME,SALARY)
AS
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,SUM(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName)
SELECT * FROM CTESALARY
--DERIVED TABLE
SELECT * FROM
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,SUM(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS DRSALARY
--Get department, total salary with respect to a department from employee table order by total salary descending
--WITH CTE
WITH CTESALARY(DID,DNAME,SALARY)
AS
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,SUM(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName)
SELECT * FROM CTESALARY
ORDER BY SALARY DESC
--DERIVED TABLE
SELECT * FROM
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,SUM(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS DRSALARY
ORDER BY SALARY DESC
--Get department wise maximum salary from employee table order by salary ascending
--WITH CTE
WITH CTESALARY(DID,DNAME,SALARY)
AS
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,MAX(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName)
SELECT * FROM CTESALARY
ORDER BY SALARY 
--DERIVED TABLE
SELECT * FROM
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,MAX(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS DRSALARY
ORDER BY SALARY 
--Get department wise minimum salary from employee table order by salary ascending
WITH CTESALARY(DID,DNAME,SALARY)
AS
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,MIN(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName)
SELECT * FROM CTESALARY
ORDER BY SALARY 
--DERIVED TABLE
SELECT * FROM
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,MIN(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS DRSALARY
ORDER BY SALARY 
--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH CTESALARY(DID,DNAME,SALARY)
AS
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,MAX(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName)
SELECT * FROM CTESALARY
WHERE SALARY > 50000
ORDER BY SALARY 
--DERIVED TABLE
SELECT * FROM
(SELECT EMP.DepartmentID AS DID,DMP.DepartmentName AS DNAME,MAX(Salary) AS SALARY FROM Employees AS EMP,Departments AS DMP
WHERE EMP.DepartmentID = DMP.DepartmentID
GROUP BY EMP.DepartmentID,DMP.DepartmentName) AS DRSALARY
WHERE SALARY > 50000
ORDER BY SALARY 

--DAY-5 TASK WITH CTE AND DERIVED TABLE
--Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
--WITH CTE
WITH CTEDIFF(FirstName,INCEPTIVE_DATE,HireDate,DIFF_INCEPTIVE)
AS
(SELECT FirstName,INCEPTIVE_DATE,HireDate,DATEDIFF(DAY,EMP.HireDate,INP.INCEPTIVE_DATE) AS DIFF_INCEPTIVE FROM Employees AS EMP, INCEPTIVE_TABLE AS INP
WHERE EMP.EmployeeID = INP.EmployeeID)
SELECT * FROM CTEDIFF
--DERIVED TABLE
SELECT * FROM (SELECT FirstName,INCEPTIVE_DATE,HireDate,DATEDIFF(DAY,EMP.HireDate,INP.INCEPTIVE_DATE) AS DIFF_INCEPTIVE FROM Employees AS EMP, INCEPTIVE_TABLE AS INP
WHERE EMP.EmployeeID = INP.EmployeeID) AS DATEDIFF
--Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
--WITH CTE
WITH CTESAL
AS
(SELECT FirstName,INCEPTIVE_SALARY FROM Employees AS EMP JOIN INCEPTIVE_TABLE AS INP
ON EMP.EmployeeID = INP.EmployeeID)
SELECT * FROM CTESAL
WHERE INCEPTIVE_SALARY>3000
--DERIVED TABLE
SELECT * FROM
(SELECT FirstName,INCEPTIVE_SALARY FROM Employees AS EMP JOIN INCEPTIVE_TABLE AS INP
ON EMP.EmployeeID = INP.EmployeeID) AS DFSAL
WHERE INCEPTIVE_SALARY > 3000
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.
--WITH CTE
WITH CTEINC(FirstName,INCEPTIVE_SALARY)
AS
(SELECT FirstName,INCEPTIVE_SALARY FROM Employees AS EMP RIGHT OUTER JOIN INCEPTIVE_TABLE AS INP
ON EMP.EmployeeID = INP.EmployeeID)
SELECT * FROM CTEINC
--DERIVED TABLE
SELECT * FROM
(SELECT FirstName,INCEPTIVE_SALARY FROM Employees AS EMP RIGHT OUTER JOIN INCEPTIVE_TABLE AS INP
ON EMP.EmployeeID = INP.EmployeeID) AS DRINC
--Select EmployeeName, ManagerName from the employee table.
--WITH CTE
WITH CTEMAN( EMPLOYEES_NAME, MANAGERS_NAME )
AS
(SELECT (EMP1.FirstName+' '+EMP1.LastName) AS EMPLOYEES_NAME,(EMP2.FirstName+' '+EMP2.LastName) AS MANAGERS_NAME FROM Employees AS EMP1 , Employees AS EMP2
WHERE EMP2.EmployeeID=EMP1.ManagerID)
SELECT * FROM CTEMAN
--DERIVED TABLE
SELECT * FROM
(SELECT (EMP1.FirstName+' '+EMP1.LastName) AS EMPLOYEES_NAME,(EMP2.FirstName+' '+EMP2.LastName) AS MANAGERS_NAME FROM Employees AS EMP1 , Employees AS EMP2
WHERE EMP2.EmployeeID=EMP1.ManagerID) AS DRMAN;

--Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.
--WITH CTE
WITH CTENULL(NAME,SALARY)
AS
(SELECT EMP.FirstName AS NAME, ISNULL(INC.INCEPTIVE_SALARY,0)AS SALARY FROM Employees AS EMP LEFT JOIN INCEPTIVE_TABLE AS INC
ON EMP.EmployeeID = INC.EmployeeID) 
SELECT * FROM CTENULL
--DERIVED TABLE
SELECT  * FROM
(SELECT EMP.FirstName AS NAME, ISNULL(INC.INCEPTIVE_SALARY,0)AS SALARY FROM Employees AS EMP LEFT JOIN INCEPTIVE_TABLE AS INC
ON EMP.EmployeeID = INC.EmployeeID) AS DRNULL