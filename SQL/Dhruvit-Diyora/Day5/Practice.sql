--employee id, name, their manager_id, manager name. 
SELECT CONCAT(E.FirstName,' ', E.LastName) AS 'EmployeeName', E.ManagerID, CONCAT(M.FirstName,' ', M.LastName) AS 'ManagerName' FROM Employees E LEFT JOIN Employees M ON E.ManagerID = M.EmployeeID 

--department name, no. of employees in department. 
SELECT D.DepartmentName, ISNULL(COUNT(E.EmployeeID), 0) AS 'No. Of Employees' 
	FROM Departments D LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID 
		GROUP BY D.DepartmentName 

--employee history with more than 8000 salary. 
SELECT J.EmployeeID, J.StartDate, J.EndDate, J.JobID, J.DepartmentID , CONCAT(E.FirstName,' ', E.LastName) AS 'EmployeeName', E.Salary AS 'Current Salary' FROM JobHistory J JOIN Employees E ON J.EmployeeID = E.EmployeeID WHERE E.Salary > 8000

--all department ID, all department name and manager first name. 
SELECT D.DepartmentID, D.DepartmentName, CONCAT(M.FirstName,' ', M.LastName) AS 'ManagerName' FROM Departments D LEFT JOIN Employees M ON D.ManagerID = M.EmployeeID

--Write a query to display the department name, manager name, and city. 
SELECT D.DepartmentID, D.DepartmentName, CONCAT(M.FirstName, SPACE(1), M.LastName) AS 'Manager_Name', L.City 
	FROM Departments D RIGHT JOIN Employees M ON D.ManagerID = M.EmployeeID 
		 JOIN Locations L ON D.LocationID = L.LocationID

--addresses of all the departments. 
SELECT D.DepartmentName, D.LocationID, L.StreetAddress, L.City, L.StateProvince, C.CountryName 
	FROM Departments D LEFT JOIN Locations L ON D.LocationID = L.LocationID JOIN Countries C ON L.CountryID = C.CountryID

--job title, employee name, difference between salary of the employee and minimum salary for the job. 
SELECT E.JobId, CONCAT(E.FirstName, SPACE(1), E.LastName) AS 'Name', (E.Salary - M.Min_Salary) AS 'Difference_in_Salary' FROM Employees E JOIN (SELECT JobId, MIN(Salary) AS 'Min_Salary'
	FROM Employees GROUP BY JobId) M ON E.JobId = M.JobId

--names, department ID and department name of all the employees. 
SELECT CONCAT(E.FirstName,' ', E.LastName) AS 'Name', E.DepartmentID, D.DepartmentName 
	FROM Employees E JOIN Departments D ON E.DepartmentID = D.DepartmentID

--names, jobtitle, department id, and department name of the employees who work in Seattle. 
SELECT CONCAT(E.FirstName,' ', E.LastName) AS 'Name', E.JobId, E.DepartmentID, D.DepartmentName, L.City 
	FROM Employees E LEFT JOIN Departments D ON E.DepartmentID = D.DepartmentID	JOIN Locations L ON D.LocationID = L.LocationID WHERE L.City = 'Seattle'