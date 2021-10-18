 --1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 
CREATE VIEW Address_Vw
AS
     SELECT D.DepartmentName
	 ,      L.LocationID
	 ,      L.StreetAddress
	 ,      L.City
	 ,      L.StateProvince
	 ,      C.CountryName
     FROM Departments D 
          JOIN Locations L 
		  ON D.LocationID=L.LocationID
          JOIN Countries C 
		  ON L.CountryID=C.CountryID

SELECT * FROM Address_Vw 
ORDER BY DepartmentName

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 
CREATE VIEW Names_Vw
AS
    SELECT (E.FirstName+' '+E.LastName) AS 'Names'
	     , E.DepartmentID
		 , D.DepartmentName
    FROM Employees E 
         JOIN Departments D 
		 ON E.DepartmentID=D.DepartmentID

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 
CREATE VIEW London_Vw
AS
   SELECT (E.FirstName+' '+E.LastName) AS 'Names'
        , E.JobId
		, E.DepartmentID
		, D.DepartmentName
		, L.City
   FROM Employees E 
        JOIN Departments D 
		ON E.DepartmentID=D.DepartmentID
        JOIN Locations L 
		ON D.LocationID=L.LocationID
   WHERE L.City = 'London'

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 
CREATE VIEW Names_Vw
AS
   SELECT E.EmployeeID
        , E.LastName AS 'Employee_Name'
		, M.LastName
		, E.ManagerID
   FROM Employees E 
        JOIN Employees M
		ON E.ManagerID=M.EmployeeID

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 
CREATE VIEW Vw
AS
   SELECT (FirstName+' '+LastName) AS 'Names'
        , HireDate
   FROM Employees
   WHERE HireDate>(
         SELECT HireDate
		 FROM Employees
		 WHERE LastName='Jones')

--6. Write a query to get the department name and number of employees in the department. 
CREATE VIEW Vw
AS
   SELECT D.DepartmentName
        , NUmbOfEmployees=COUNT(E.EmployeeID)
   FROM Employees E
        RIGHT JOIN Departments D
		ON E.DepartmentID=D.DepartmentID
   GROUP BY D.DepartmentName


--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 
CREATE VIEW Vw
AS
   SELECT EmployeeID
        , JobID
		, DATEDIFF(dd,StartDate,EndDate) 'Days'
   FROM JobHistory
   WHERE DepartmentID=90

--8. Write a query to display the department ID, department name and manager first name. 
CREATE VIEW Vw
AS
   SELECT D.DepartmentID
        , D.DepartmentName
		, E.FirstName
   FROM Departments D
        JOIN Employees E
		ON D.ManagerID=E.EmployeeID


--9. Write a query to display the department name, manager name, and city. 
CREATE VIEW Vw
AS
   SELECT D.DepartmentID
        , D.DepartmentName
		, E.FirstName
		, L.City
   FROM Departments D
       JOIN Employees E
	   ON D.ManagerID=E.EmployeeID
	   JOIN Locations L
	   ON D.LocationID=L.LocationID


--10. Write a query to display the job title and average salary of employees. 
CREATE VIEW Vw
AS
   SELECT JobId
        , AVG(Salary) 'Salary'
   FROM Employees
   GROUP BY JobId


--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 
CREATE VIEW Vw
AS
   SELECT J.JobTitle
        , E.FirstName+' '+E.LastName AS Employee_Name
		, E.Salary-J.MinSalary AS Salary_Diff
   FROM Employees E
        JOIN jobs J
		ON E.JobId = J.JobId
		SELECT * FROM jobs

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 
CREATE VIEW Vw
AS
   SELECT * FROM JobHistory J
   WHERE EmployeeID IN(
         SELECT EmployeeID
		 FROM Employees
		 WHERE EmployeeID=J.EmployeeID
		   AND Salary>10000)
--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years. 
CREATE VIEW Vw
AS
   SELECT (E.FirstName+' '+E.LastName) AS 'Names'
		, D.DepartmentName
		, E.HireDate
		, E.Salary
	FROM Departments D
	     JOIN Employees E
		 ON D.ManagerID= E.EmployeeID
	WHERE DATEDIFF(yy,E.HireDate,GETDATE())>15




SELECT * FROM Departments
SELECT * FROM Employees
SELECT * FROM Locations
SELECT * FROM JobHistory