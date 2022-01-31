SELECT * FROM Employees 
SELECT * FROM Departments
SELECT * FROM Locations
SELECT * FROM Countries
SELECT * FROM JobHistory

---1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

SELECT D.LocationID,StreetAddress,City, StateProvince,CountryName
FROM Departments D LEFT JOIN Locations L ON D.LocationID=L.LocationID
INNER JOIN Countries C ON L.CountryID=C.CountryID


---2. Write a query to find the names (first_name, last name), department ID and name of all the employees.
SELECT CONCAT(FirstName,' ',LastName) NAMES,DepartmentName,E.DepartmentID FROM Employees E,Departments


---3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.
SELECT CONCAT(FirstName,' ',LastName) NAMES,JobID,E.DepartmentID ,DepartmentName FROM Employees E INNER JOIN Departments D
ON E.DepartmentID =D.DepartmentID INNER JOIN Locations L ON D.LocationID=L.LocationID WHERE City= 'LONDON'


---4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).
SELECT E.EmployeeID,E.LastName'NAMES',E.ManagerID ,M.LastName'MANAGER NAME' FROM Employees E LEFT JOIN Employees M ON E.ManagerID =M.EmployeeID
 

---5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.

SELECT CONCAT(FirstName,' ',LastName) NAMES,HireDate FROM Employees WHERE HireDate > (SELECT HireDate FROM Employees WHERE LastName = 'Jones')

---6. Write a query to get the department name and number of employees in the department.

SELECT DepartmentName AS 'Department Name', COUNT(*) AS 'No of Employees' FROM Departments D INNER JOIN Employees E ON E.DepartmentID = D.DepartmentID 
GROUP BY DepartmentName ;


---7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID, JobID, DATEDIFF(DAY, StartDate, EndDate) AS 'Days' FROM JobHistory WHERE DepartmentID =90


---8. Write a query to display the department ID, department name and manager first name.
SELECT D.DepartmentID,DepartmentName, FirstName 'Manager name' FROM Departments D LEFT JOIN Employees M ON D.ManagerID = M.EmployeeID

---9. Write a query to display the department name, manager name, and city.

SELECT D.DepartmentID, D.DepartmentName, CONCAT(M.FirstName,' ', M.LastName) AS 'Manager_Name', L.City FROM Departments D
LEFT JOIN Employees M ON D.ManagerID = M.EmployeeID 
LEFT JOIN Locations L ON D.LocationID = L.LocationID

---10. Write a query to display the job title and average salary of employees.
SELECT JobId, AVG(Salary) 'AVARAGE SALARY' FROM Employees GROUP BY JobId

---11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
SELECT E.JobId, CONCAT(E.FirstName, ' ', E.LastName) AS 'Name', (E.Salary - M.Min_Salary) AS 'Difference_in_Salary' FROM Employees E
JOIN (SELECT JobId, MIN(Salary) AS 'Min_Salary' FROM Employees GROUP BY JobId) M ON E.JobId = M.JobId

---12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.

SELECT J.EmployeeID, J.StartDate, J.EndDate, J.JobID, J.DepartmentID , E.Salary AS 'Current_Salary' FROM JobHistory J 
JOIN Employees E ON J.EmployeeID = E.EmployeeID WHERE E.Salary > 10000

---13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for 
---    all managers whose experience is more than 15 years.
SELECT D.DepartmentName, CONCAT(E.FirstName, SPACE(1), E.LastName) AS 'Name', E.HireDate, E.Salary FROM Departments D 
LEFT JOIN Employees E ON D.ManagerID = E.EmployeeID 
WHERE DATEDIFF(YEAR, E.HireDate, GETDATE()) > 15