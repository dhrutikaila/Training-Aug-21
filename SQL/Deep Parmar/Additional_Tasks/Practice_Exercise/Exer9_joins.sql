--1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

	  SELECT LOC.LocationID,LOC.StreetAddress,LOC.City,LOC.StateProvince,C.CountryName FROM Locations AS LOC 
	  JOIN Countries AS C ON C.CountryID=LOC.CountryID
	  JOIN Departments AS DEPT ON LOC.LocationID=DEPT.LocationID

--2. Write a query to find the names (first_name, last name), department ID and name of all the employees.

	 SELECT Employee_Name=CONCAT(FirstName,SPACE(1),LastName),DEPT.DepartmentID,DEPT.DepartmentName FROM Employees AS EMP 
	 JOIN Departments AS DEPT ON EMP.DepartmentID=DEPT.DepartmentID

--3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.

	 SELECT (EMP.FirstName+' '+EMP.LastName) AS Employee_Name,EMP.JobId,DEPT.DepartmentID,DEPT.DepartmentName from Employees AS EMP 
	 JOIN Departments AS DEPT ON EMP.DepartmentID=DEPT.DepartmentID
	 JOIN Locations AS LOC ON LOC.LocationID=DEPT.LocationID
	 WHERE LOC.City='London'

--4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).

	 SELECT EMP.EmployeeID,EMP.LastName AS [Employee_Name],MGR.EmployeeID AS Manager_Id,MGR.LastName AS [Manager_Name] FROM Employees AS EMP 
	 JOIN Employees AS MGR ON EMP.ManagerID=MGR.EmployeeID

--5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.

	 SELECT Employee_Name=(EMP1.FirstName+SPACE(1)+EMP1.LastName),Emp1.HireDate FROM Employees AS EMP1 
	 JOIN Employees as EMP2 ON EMP2.LastName='Jones'
	 WHERE EMP1.HireDate > EMP2.HireDate


	--ANOTHER WAY:-
	--USING SUBQUEARY
	 SELECT Employee_Name=(EMP.FirstName+SPACE(1)+EMP.LastName),Emp.HireDate FROM Employees AS EMP 
	 WHERE EMP.HireDate > (SELECT HireDate FROM Employees WHERE LastName='Jones')

--6. Write a query to get the department name and number of employees in the department.

	 SELECT DEPT.DepartmentName,COUNT(EmployeeID) AS Number_Of_Employee FROM Employees AS EMP 
	 JOIN Departments AS DEPT ON EMP.DepartmentID=DEPT.DepartmentID GROUP BY DEPT.DepartmentName

--7. Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

	 SELECT JH.EmployeeID,J.JOB_TITLE,Number_Of_Days=(DATEDIFF(DD,StartDate,EndDate)) FROM  JobHistory AS JH 
	 JOIN jobs AS J ON J.JOB_ID=JH.JobId
	 WHERE JH.DepartmentID=90
	 

--8. Write a query to display the department ID, department name and manager first name.

	 SELECT DEPT.DepartmentID,DEPT.DepartmentName,MGR.FirstName AS Manager_Name FROM Departments AS DEPT 
	 JOIN Employees AS MGR ON DEPT.ManagerID=MGR.EmployeeID

--9. Write a query to display the department name, manager name, and city.

	 SELECT DEPT.DepartmentName,(MGR.FirstName+' '+MGR.LastName) AS Manager_Name,LOC.City FROM Departments AS DEPT 
	 JOIN Employees AS MGR ON DEPT.ManagerID=MGR.EmployeeID
	 JOIN Locations AS LOC ON LOC.LocationID=DEPT.LocationID

--10. Write a query to display the job title and average salary of employees.

	 SELECT J.JOB_TITLE,AVG(Salary) AS Average_Salary FROM Employees AS EMP
	 JOIN jobs AS J ON EMP.JobId=J.JOB_ID GROUP BY JOB_TITLE

--11. Display job title, employee name, and the difference between salary of the employee and minimum salary for the job.

	  SELECT J.JOB_TITLE,(EMP.FirstName+' '+EMP.LastName) AS Employee_Name,Difference_Of_Salary=(EMP.Salary-J.MIN_SALARY) FROM Employees AS EMP
	  JOIN jobs AS J ON EMP.JobId=J.JOB_ID

	  --ANOTHER WAY:-
	  --WITHOUT JOBS TABLE 
	  SELECT EMP1.JobId,Employee_Name=(EMP1.FirstName+SPACE(1)+EMP1.LastName),Difference_Of_Salary =(EMP1.Salary-EMP2.Minimum_Salary) FROM Employees AS EMP1
	  JOIN (SELECT JobId,MIN(Salary) AS Minimum_Salary FROM Employees GROUP BY JobId)EMP2 ON EMP1.JobId=EMP2.JobId 

--12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.

	  SELECT JH.* FROM JobHistory AS JH
	  JOIN Employees AS EMP ON JH.EmployeeID=EMP.EmployeeID
	  WHERE EMP.Salary > 10000
	
--13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

	  SELECT DEPT.DepartmentName,Manager_Name=(MGR.FirstName+' '+MGR.LastName),MGR.HireDate,MGR.Salary FROM Departments AS DEPT
	  JOIN Employees AS MGR ON DEPT.ManagerID=MGR.EmployeeID
	  WHERE DATEDIFF(YYYY,MGR.HireDate,GETDATE()) > 15


