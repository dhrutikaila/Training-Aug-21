USE Additional_Practice
--Main Database--

--1)Write a query to find the addresses (location_id, street_address, city, state_province, country_name) 
--  of all the departments. 
SELECT CONCAT(L.LocationID,' ',L.StreetAddress,' ',L.City,' ',L.StateProvince,' ',C.CountryName) As 'Addresses' 
FROM Departments D LEFT OUTER JOIN Locations L ON D.LocationID = L.LocationID 
INNER JOIN Countries C ON L.CountryID = C.CountryID

--2)Write a query to find the names (first_name, last name), department ID and name of all the employees. 
SELECT CONCAT(E.FirstName,' ', E.LastName) AS 'Names', E.DepartmentID, D.DepartmentName 
FROM Employees E INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID

--3)Find the names (first_name, last_name), job, department number, and department name of the employees 
--  who work in London. 
SELECT CONCAT(E.FirstName,' ', E.LastName) AS 'Names', E.JobId, E.DepartmentID, D.DepartmentName 
FROM Employees E LEFT OUTER JOIN Departments D ON E.DepartmentID = D.DepartmentID
INNER JOIN Locations L ON D.LocationID = L.LocationID WHERE L.City = 'London'

--4)Write a query to find the employee id, name (last_name) along with their manager_id, 
--  manager name (last_name). 
SELECT E.EmployeeID, E.LastName, E.ManagerID, M.LastName 
FROM Employees E INNER JOIN Employees M ON E.ManagerID = M.EmployeeID 

--5)Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
SELECT CONCAT(FirstName,' ', LastName) AS 'Name', HireDate 
FROM Employees WHERE HireDate > (SELECT HireDate FROM Employees WHERE LastName = 'Jones')

--6)Write a query to get the department name and number of employees in the department. 
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS 'Total Employees' 
FROM Departments D LEFT OUTER JOIN Employees E ON D.DepartmentID = E.DepartmentID GROUP BY D.DepartmentName

--7)Find the employee ID, job title, number of days between ending date and starting date 
--  for all jobs in department 90 from job history. 
SELECT EmployeeID, JobID, DATEDIFF(dd, StartDate, EndDate) AS 'No. Of Days' 
FROM JobHistory WHERE DepartmentID = 90

--8)Write a query to display the department ID, department name and manager first name. 
SELECT D.DepartmentID, D.DepartmentName, E.FirstName AS 'ManagerName' 
FROM Departments D LEFT OUTER JOIN Employees E ON D.ManagerID = E.EmployeeID

--9)Write a query to display the department name, manager name, and city. 
SELECT D.DepartmentID, D.DepartmentName, CONCAT(M.FirstName,' ', M.LastName) AS 'ManagerName', L.City 
FROM Departments D LEFT OUTER JOIN Employees M ON D.ManagerID = M.EmployeeID 
LEFT OUTER JOIN Locations L ON D.LocationID = L.LocationID

--10)Write a query to display the job title and average salary of employees. 
SELECT JobId, AVG(Salary) AS 'AvgSal' FROM Employees GROUP BY JobId

--11)Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
SELECT E.JobId, CONCAT(E.FirstName,' ', E.LastName) AS 'Names', (E.Salary - temp.MinSal) AS 'DiffInSal' 
FROM Employees E INNER JOIN (SELECT JobId, MIN(Salary) AS 'MinSal' 
FROM Employees GROUP BY JobId)temp ON E.JobId = temp.JobId

--12)Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
SELECT J.EmployeeID, J.StartDate, J.EndDate, J.JobID, J.DepartmentID , E.Salary AS 'CurrentSalary'
FROM JobHistory J INNER JOIN Employees E ON J.EmployeeID = E.EmployeeID 
WHERE E.Salary > 10000

--13)Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 
SELECT D.DepartmentName, CONCAT(E.FirstName,' ', E.LastName) AS 'Names', E.HireDate, E.Salary 
FROM Departments D LEFT OUTER JOIN Employees E ON D.ManagerID = E.EmployeeID 
WHERE DATEDIFF(YEAR, E.HireDate, GETDATE()) > 15