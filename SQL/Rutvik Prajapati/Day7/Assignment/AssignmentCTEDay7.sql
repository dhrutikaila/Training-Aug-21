--Table Name: Employee

--Convert Day4 and Day5 Exercises with CTE and Derived Table.

--Day4
--CTC
--Write a query to rank employees based on their salary for a month
	
	WITH CTENAME ([DENSE RANK],FirstName,LastName,Salary )
	AS 
	(
	SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) [DENSE RANK],FirstName,LastName,Salary 
	FROM Employees
	)
	SELECT * FROM CTENAME
--Select 4th Highest salary from employee table using ranking function
	WITH CTENAME
	AS 
	(	
    SELECT DENSE_RANK() OVER (ORDER BY SALARY DESC) 'Rank',Salary 
    FROM Employees
   	)
	SELECT TOP 1 Salary FROM CTENAME WHERE Rank = 4

--Get department, total salary with respect to a department from employee table.
	WITH CTENAME
	AS 
	(	
    SELECT DepartmentID,SUM(Salary) AS TotalSalary
	FROM Employees
	GROUP BY DepartmentID
   	)
	SELECT * FROM CTENAME 

--Get department, total salary with respect to a department from employee table order by total salary descending
	WITH CTENAME
	AS 
	(	
    SELECT DepartmentID,SUM(Salary) AS TotalSalary
	FROM Employees
	GROUP BY DepartmentID
   	)
	SELECT * FROM CTENAME ORDER BY TotalSalary DESC

--Get department wise maximum salary from employee table order by salary ascending
WITH CTENAME
	AS 
	(	
   SELECT DepartmentID,MAX(Salary) AS [Maximum Salary]
	FROM Employees
	GROUP BY DepartmentID 
   	)
	SELECT * FROM CTENAME ORDER BY [Maximum Salary] ASC
--Get department wise minimum salary from employee table order by salary ascending
WITH CTENAME
	AS 
	(	
   SELECT DepartmentID,MIN(Salary) AS [Minimum Salary]
	FROM Employees
	GROUP BY DepartmentID 
   	)
	SELECT * FROM CTENAME ORDER BY [Minimum Salary] ASC

--Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending
WITH CTENAME
	AS 
	(	
	SELECT DepartmentID,SUM(Salary)[Total Salary]
	FROM Employees
	GROUP BY DepartmentID
	HAVING SUM(Salary)>5000
    )
	SELECT * FROM CTENAME ORDER BY [Total Salary] DESC

--Day5
--CTC
--Assignment:

--1.Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
	WITH CTENAME
	AS 
	(	
	SELECT DATEDIFF(MM,E.HireDate,I.IncentiveDate) AS 'DiffInDate' FROM Employees AS E
	INNER JOIN Incentives AS I on E.EmployeeID=I.EmployeeID
    )
	SELECT * FROM CTENAME
--2.Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
	WITH CTENAME
	AS 
	(	
	SELECT E.EmployeeID,E.FirstName,I.IncentiveAmount FROM Employees AS E
	INNER JOIN Incentives AS I on E.EmployeeID=I.EmployeeID
	where I.IncentiveAmount > 3000
    )
	SELECT * FROM CTENAME
--3.Select first_name, incentive amount from employee and incentives table for all employees even if they didn�t get incentives.
   	WITH CTENAME
	AS 
	(	
	SELECT E.EmployeeID,E.FirstName,I.IncentiveAmount FROM Employees AS E
	LEFT JOIN Incentives AS I on E.EmployeeID=I.EmployeeId
    )
	SELECT * FROM CTENAME
--4.Select EmployeeName, ManagerName from the employee table.
   	WITH CTENAME
	AS 
	(	
	SELECT E.FirstName AS EmployeeName,M.FirstName AS ManagerName
	FROM Employees AS E 
	LEFT JOIN Employees AS M ON E.ManagerID = M.EmployeeID
    )
	SELECT * FROM CTENAME
--Select first_name, incentive amount from employee and incentives table for all employees even if they didn�t get incentives and set incentive amount as 0 for those employees who didn�t get incentives.
	WITH CTENAME
	AS 
	(	
	 SELECT E.FirstName,COALESCE(I.IncentiveAmount,0) as 'Incentive Amount'
	FROM Employees AS E
	LEFT JOIN Incentives AS I ON E.EmployeeID = I.EmployeeID
    )
	SELECT * FROM CTENAME