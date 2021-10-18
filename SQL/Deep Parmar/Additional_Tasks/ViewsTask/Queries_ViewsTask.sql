--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

	 CREATE VIEW Department_Address_Details
	 AS
	 SELECT DEPT.DepartmentName,[Address]=CONCAT(LOC.LocationID,LOC.StreetAddress,LOC.City,LOC.StateProvince,C.CountryName) FROM Departments AS DEPT
	 JOIN Locations AS LOC ON LOC.LocationID=DEPT.LocationID
	 JOIN Countries AS C ON C.CountryID=LOC.CountryID

	 SELECT * FROM Department_Address_Details

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees. 

	 CREATE VIEW Employee_Details
	 AS
	 SELECT Employee_Name=(EMP.FirstName+' '+EMP.LastName),DEPT.DepartmentID,DEPT.DepartmentName FROM Employees AS EMP 
	 JOIN Departments AS DEPT ON EMP.DepartmentID=DEPT.DepartmentID

	 SELECT * FROM Employee_Details

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

	 CREATE VIEW London_Employee
	 AS
	 SELECT Employee_Name=CONCAT(EMP.FirstName,' ',EMP.LastName),JobId,DEPT.DepartmentID,DEPT.DepartmentName FROM Employees AS EMP
	 JOIN Departments AS DEPT ON EMP.DepartmentID=DEPT.DepartmentID 
	 JOIN Locations AS LOC ON LOC.LocationID=DEPT.LocationID WHERE LOC.City='London'

	 SELECT * FROM London_Employee

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

	 CREATE VIEW Employee_Manager_Details
	 AS
	 SELECT EMP.EmployeeID,EMP.LastName AS Employee_Name,MGR.EmployeeID AS Manager_Id,MGR.LastName AS Manager_Name FROM Employees AS EMP
	 JOIN Employees AS MGR ON EMP.ManagerID=MGR.EmployeeID

	 SELECT * FROM Employee_Manager_Details

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

	 CREATE VIEW Employee_Hired_After_Jones
	 AS
	 SELECT (EMP1.FirstName+SPACE(1)+EMP1.LastName) AS Employee_Name,EMP1.HireDate FROM Employees AS EMP1
	 JOIN Employees AS EMP2 ON EMP2.LastName='Jones' 
	 WHERE EMP1.HireDate > EMP2.HireDate
	 
	 SELECT * FROM Employee_Hired_After_Jones

--6. Write a query to get the department name and number of employees in the department. 

	 CREATE VIEW Employees_Department_Detail
	 AS 
	 SELECT DEPT.DepartmentName,COUNT(EMP.EmployeeID) AS Number_Of_Employees FROM Departments AS DEPT 
	 JOIN Employees AS EMP ON EMP.DepartmentID=DEPT.DepartmentID 
	 GROUP BY DEPT.DepartmentName

	 SELECT * FROM Employees_Department_Detail

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

	 CREATE VIEW Job_History_Department90
	 AS
	 SELECT JH.EmployeeID,J.JOB_TITLE,Number_Of_Days=DATEDIFF(DD,JH.StartDate,JH.EndDate) FROM JobHistory AS JH
	 JOIN jobs AS J ON J.JOB_ID=JH.JobID
	 WHERE JH.DepartmentID=90

	 SELECT * FROM Job_History_Department90

--8. Write a query to display the department ID, department name and manager first name. 
	 
	 CREATE VIEW Department_ManagerName
	 AS
	 SELECT DEPT.DepartmentID,DEPT.DepartmentName,MGR.FirstName AS Manager_Name FROM Departments AS DEPT
	 JOIN Employees AS MGR ON DEPT.ManagerID=MGR.EmployeeID

	 SELECT * FROM Department_ManagerName

--9. Write a query to display the department name, manager name, and city. 

	 CREATE VIEW Manager_Details
	 AS
	 SELECT DEPT.DepartmentName,Manager_Name=(MGR.FirstName+' '+MGR.LastName),LOC.City FROM Departments AS DEPT
	 JOIN Employees AS MGR ON DEPT.ManagerID=MGR.EmployeeID
	 JOIN Locations AS LOC ON LOC.LocationID=DEPT.LocationID

	 SELECT * FROM Manager_Details

--10. Write a query to display the job title and average salary of employees. 

	  CREATE VIEW Employee_AverageSalary
	  AS
	  SELECT J.JOB_TITLE,AVG(Salary) AS Average_Salary FROM jobs AS J
	  JOIN Employees AS EMP ON EMP.JobId=J.JOB_ID
	  GROUP BY J.JOB_TITLE

	  SELECT * FROM Employee_AverageSalary

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

	  CREATE VIEW Employee_Salary_Difference
	  AS
	  SELECT J.JOB_TITLE,Employee_Name=CONCAT(EMP.FirstName,SPACE(1),EMP.LastName),(EMP.Salary-J.MIN_SALARY) AS Salary_Difference
	  FROM jobs AS J
	  JOIN Employees AS EMP ON EMP.JobId=J.JOB_ID

	  SELECT * FROM Employee_Salary_Difference

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

	  CREATE VIEW Employee_JobHistory_Salary_Morethan_10000
	  AS
	  SELECT JH.* FROM JobHistory AS JH
	  JOIN Employees AS EMP ON EMP.EmployeeID=JH.EmployeeID
	  WHERE EMP.Salary > 10000

	  SELECT * FROM Employee_JobHistory_Salary_Morethan_10000

--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for 
--    all managers whose experience is more than 15 years. 

	  CREATE VIEW Employee_Experience_Detail
	  AS
	  SELECT DEPT.DepartmentName,Manager_Name=(MGR.FirstName+SPACE(1)+MGR.LastName),MGR.HireDate,MGR.Salary FROM Departments AS DEPT
	  JOIN Employees AS MGR ON DEPT.ManagerID=MGR.EmployeeID
	  WHERE DATEDIFF(YYYY,MGR.HireDate,GETDATE()) > 15

	  SELECT * FROM Employee_Experience_Detail


	 
