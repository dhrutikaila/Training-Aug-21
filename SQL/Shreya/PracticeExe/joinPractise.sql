--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

SELECT d.DepartmentID, l.LocationID , l.StreetAddress , l.State ,l.CountryID
FROM Locations l JOIN Departments d ON d.LocationID=l.LocationID 

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
SELECT DepartmentID , FirstName + ' '+LastName 'NAME'  
FROM Employees

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

SELECT e.FirstName +' '+e.LastName 'NAME' ,e.JobId ,d.DepartmentID,d.DepartmentName,l.City  FROM Employees e 
JOIN Departments d ON e.DepartmentID=d.DepartmentID
JOIN Locations l ON d.LocationID=l.LocationID WHERE l.City='London'

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).

SELECT e.FirstName+' '+e.LastName 'Employee_name',m.EmployeeID as 'Manager id',m.FirstName+' '+m.LastName 'Manager Name' 
FROM Employees e 
JOIN Employees m ON e.ManagerID=m.EmployeeID

SELECT * FROM Employees 

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'

SELECT FirstName+' '+LastName,HireDate  FROM Employees 
WHERE HireDate > (SELECT HireDate FROM Employees WHERE LastName='Jones')

--6. Write a query to get the department name and number of employees in the department.

SELECT d.DepartmentName,COUNT(EmployeeID)
FROM Employees e
JOIN Departments d ON e.DepartmentID=d.DepartmentID
GROUP BY d.DepartmentName

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

SELECT J.EmployeeID,d.DepartmentID,j.JobID ,DATEDIFF(DAY,j.StartDate,j.EndDate) 'DATEDIFF'
FROM Departments d 
JOIN JobHistory j ON d.DepartmentID=j.DepartmentID 
WHERE d.DepartmentID=90


--8. Write a query to display the department ID, department name and manager first name. 

SELECT DISTINCT e.DepartmentID,e.FirstName+' '+e.LastName 'MANAGER NAME',DepartmentName
FROM Employees e
JOIN Employees m ON e.EmployeeID=m.ManagerID
JOIN Departments d ON e.DepartmentID=d.DepartmentID


--9. Write a query to display the department name, manager name, and city.

SELECT m.FirstName+' '+m.LastName 'MANAGER NAME',d.DepartmentName,l.city
FROM Employees e
JOIN Employees m ON e.EmployeeID=m.ManagerID
JOIN Departments d ON e.DepartmentID=d.DepartmentID
JOIN Locations l ON d.LocationID=l.LocationID

--10. Write a query to display the job title and average salary of employees. 

SELECT AVG(Salary),JobId FROM Employees
GROUP BY JobId
ORDER BY AVG(Salary)

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

--SELECT e.FirstName +' '+e.LastName,(e.Salary-e1.Salary),e.JobId FROM Employees e
-- JOIN (SELECT MIN(Salary),JobId FROM Employees GROUP BY JobId) as e1
--ON e.JobId=e1.JobId


--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
SELECT * FROM JobHistory
SELECT * FROM Employees

SELECT  e.EmployeeID,j.StartDate,j.EndDate,j.JobID,j.DepartmentID,e.Salary FROM Employees e
JOIN JobHistory j ON e.EmployeeID=j.EmployeeID
WHERE e.Salary > 10000

/*13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all
managers whose experience is more than 15 years. */

SELECT DISTINCT d.DepartmentName,e.FirstName+' '+e.LastName 'NAME',e.HireDate,e.Salary FROM Employees e
JOIN Employees m ON e.EmployeeID=m.ManagerID
JOIN Departments d ON e.DepartmentID=d.DepartmentID
WHERE DATEDIFF(YEAR,e.HireDate,GETDATE())>15

