WITH CTE 
AS  
(SELECT EmployeeID, Salary, YEAR(HireDate) AS HireYear FROM Employees)
SELECT * FROM CTE


WITH CTE AS  (  
  SELECT D.DepartmentName, C.CountryName FROM Departments D	LEFT JOIN Locations L ON D.LocationID = L.LocationID JOIN Countries C ON L.CountryID = C.CountryID)  
SELECT * FROM CTE 


WITH CTE AS (SELECT D.DepartmentName, ISNULL(COUNT(E.EmployeeID), 0) AS 'Employees' 	FROM Departments D LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID GROUP BY D.DepartmentName )
SELECT * FROM CTE WHERE Employees > 5


WITH CTE (EmpID,StDate,EnDate,JobId,DeptId,Name,Salary)
AS
(	SELECT J.EmployeeID, J.StartDate, J.EndDate, J.JobID, J.DepartmentID , CONCAT(E.FirstName,' ', E.LastName) AS 'EmployeeName', E.Salary AS 'Salary' FROM JobHistory J JOIN Employees E ON J.EmployeeID = E.EmployeeID WHERE E.Salary > 8000
)
SELECT * FROM CTE

WITH CTE AS
(	SELECT D.DepartmentID, D.DepartmentName, CONCAT(M.FirstName,' ', M.LastName) AS 'Manager_Name', L.City 
		FROM Departments D RIGHT JOIN Employees M ON D.ManagerID = M.EmployeeID JOIN Locations L ON D.LocationID = L.LocationID
)
SELECT * FROM CTE