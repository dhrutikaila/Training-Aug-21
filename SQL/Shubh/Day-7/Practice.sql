--1. CTE1
WITH EmpCTE (EmployeeID, Salary, HireYear)  
AS  
(SELECT EmployeeID, Salary, YEAR(HireDate) AS HireYear FROM Employees)
SELECT * FROM EmpCTE

--2. CTE2
WITH DepCTE (Department, Country)  
AS  
(  
  SELECT D.DepartmentName, C.CountryName 
	FROM Departments D
		LEFT JOIN Locations L ON D.LocationID = L.LocationID 
			JOIN Countries C ON L.CountryID = C.CountryID
 
)  
SELECT * FROM DepCTE 

--3. CTE3
WITH MgrCTE (DeptId,DeptName,Manager,City)
AS
(	SELECT D.DepartmentID, D.DepartmentName, CONCAT(M.FirstName,' ', M.LastName) AS 'Manager_Name', L.City 
		FROM Departments D RIGHT JOIN Employees M ON D.ManagerID = M.EmployeeID 
			 JOIN Locations L ON D.LocationID = L.LocationID
)
SELECT * FROM MgrCTE

--4. CTE4
WITH DeptCTE (DeptName, EmployeesTotal)
AS
(SELECT D.DepartmentName, ISNULL(COUNT(E.EmployeeID), 0) AS 'No. Of Employees' 
	FROM Departments D LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID 
		GROUP BY D.DepartmentName 
)
SELECT * FROM DeptCTE WHERE EmployeesTotal > 5

--5. CTE5
WITH EmplCTE (EmpID,StDate,EnDate,JobId,DeptId,Name,Salary)
AS
(	SELECT J.EmployeeID, J.StartDate, J.EndDate, J.JobID, J.DepartmentID , CONCAT(E.FirstName,' ', E.LastName) AS 'EmployeeName', E.Salary AS 'Current Salary'
		FROM JobHistory J JOIN Employees E ON J.EmployeeID = E.EmployeeID 
			WHERE E.Salary > 8000
)
SELECT * FROM EmplCTE

--6. Derived1
SELECT TOP 5 Salary, EmployeeID, CONCAT(FirstName,' ',LastName) AS 'Name' FROM Employees WHERE EmployeeID NOT IN (SELECT ManagerID FROM Departments)

--7. Derived2
SELECT * FROM Locations WHERE StateProvince=''

--8. Derived3
SELECT D.DepartmentName, D.LocationID, L.StreetAddress, L.City, L.StateProvince, C.CountryName 
	FROM Departments D
		LEFT JOIN Locations L ON D.LocationID = L.LocationID 
			JOIN Countries C ON L.CountryID = C.CountryID