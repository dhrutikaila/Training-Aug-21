--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
SELECT D.DepartmentName
     , D.LocationID
     , L.StreetAddress
     , L.City
     , L.StateProvince
     , C.CountryName
FROM Departments D
   JOIN Locations L 
   ON D.LocationID = L.LocationID
   JOIN Countries C
   ON L.CountryID = C.CountryID

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 

SELECT (FirstName+' '+LastName) 'Name'
     , D.DepartmentID
     , D.DepartmentName
FROM Employees E
  JOIN Departments D
  ON E.DepartmentID = D.DepartmentID

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

SELECT (FirstName+' '+LastName) 'Name'
     , E.JobId
     , D.DepartmentID
     , D.DepartmentName
FROM Employees E
  JOIN Departments D
  ON E.DepartmentID = D.DepartmentID
  JOIN Locations L
  ON D.LocationID = L.LocationID
WHERE L.City = 'London'

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

SELECT E.EmployeeID
     , E.LastName
     , M.EmployeeID
     , M.LastName
FROM Employees E
  JOIN Employees M
  ON E.ManagerID = M.EmployeeID

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

SELECT (E.FirstName+' '+E.LastName) 'Name'
     , E.HireDate
FROM Employees E
 JOIN Employees E2
 ON E.HireDate > E2.HireDate
WHERE E2.LastName = 'Jones'

--6. Write a query to get the department name and number of employees in the department. 

SELECT D.DepartmentName
     , COUNT(E.EmployeeID) 'Employees'
FROM Departments D
  LEFT JOIN Employees E
  ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

SELECT E.EmployeeID
     , E.JobId
     , J.StartDate
     , J.EndDate
     , DATEDIFF(DD, J.StartDate, J.EndDate) 'Difference'
FROM JobHistory J
  JOIN Employees E
  ON J.EmployeeID = E.EmployeeID
WHERE J.DepartmentID = 90 



--8. Write a query to display the department ID, department name and manager first name. 

SELECT D.DepartmentID
     , D.DepartmentName
     , M.FirstName
FROM Departments  D
  JOIN Employees M
  ON D.ManagerID = M.EmployeeID

--9. Write a query to display the department name, manager name, and city. 

SELECT D.DepartmentName
     , (M.FirstName+' '+M.LastName) 'Name'
     , L.City
FROM Departments D
  JOIN Employees M
  ON D.ManagerID = M.EmployeeID
  JOIN Locations L
  ON D.LocationID = L.LocationID 

--10. Write a query to display the job title and average salary of employees. 

SELECT JobId
     , CONVERT(DECIMAL(8,2),AVG(Salary)) 'Salary'
FROM Employees
GROUP BY JobId

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
SELECT E.JobId
     , (E.FirstName+' '+E.LastName) 'Name'
     , E.Salary
     , E.Salary - MIN(E1.Salary) AS 'Difference'
FROM Employees E
  JOIN Employees E1 
  ON E.JobId = E1.JobId
GROUP BY E1.JobId, E1.Salary, E.JobId, E.FirstName, E.LastName, E.Salary

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

SELECT J.EmployeeID 
     , J.JobID
     , (E.FirstName+' '+E.LastName) 'Name'
     , E.Salary
FROM JobHistory J
  JOIN Employees E
  ON J.EmployeeID = E.EmployeeID
WHERE E.Salary > 10000

--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 

SELECT D.DepartmentName
     , (M.FirstName+' '+M.LastName) 'Name'
     , M.HireDate
     , M.Salary
FROM Departments D
  JOIN Employees M
  ON D.ManagerID = M.EmployeeID
WHERE DATEDIFF(YYYY,M.HireDate,GETDATE()) >15

