--Select employee details from employee table if data exists in incentive table ?
SELECT * FROM Employee1 
WHERE Employee_id 
   IN (SELECT Employee_ref_id FROM Incentives)

--Find Salary of the employee whose salary is more than Roy Salary
SELECT * FROM Employee1 
WHERE Salary>
      (SELECT Salary FROM Employee1
	    WHERE First_name= 'ROY')

--Create a view to select FirstName,LastName,Salary,JoiningDate,IncentiveDate and IncentiveAmount
CREATE VIEW Col_View
AS
  SELECT E.First_name
       , E.Last_name
	   , E.Salary
	   , E.Joining_Date
	   , I.Incentive_Date
	   , I.Incentive_amount 
  FROM Employee1 E 
       JOIN Incentives I 
	   ON E.Employee_id=I.Employee_ref_id

--Create a view to select Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
CREATE VIEW Inc_View
AS
  SELECT E.First_name
       , I.Incentive_amount 
  FROM Employee1 E 
       JOIN Incentives I 
	   ON E.Employee_id=I.Employee_ref_id
  WHERE I.Incentive_amount>3000

--Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London
CREATE VIEW London
AS
  SELECT E.FirstName+' '+ E.LastName AS names
       , E.JobId
	   , D.DepartmentID
	   , D.DepartmentName
  FROM Employees E 
       JOIN Departments D 
	   ON E.DepartmentID=D.DepartmentID
       JOIN Locations L
	   ON D.LocationID=L.LocationID
  WHERE L.City='London'

--Create a View to get the department name and number of employees in the department.
CREATE VIEW Department_View
AS
  SELECT DepartmentID
       , DepartmentName 
  FROM Departments

--Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
SELECT EmployeeID
     , JobID
	 , DATEDIFF(dd,StartDate,EndDate) 'Days' 
FROM JobHistory 
WHERE DepartmentID=90

--Write a View to display the department name, manager name, and city.
CREATE VIEW Name_View
AS
  SELECT E.FirstName+' '+ E.LastName AS names
       , D.DepartmentName
	   , L.City
  FROM Departments D 
  JOIN  Employees E
  ON D.ManagerID=E.EmployeeID
  JOIN Locations L
  ON D.LocationID=L.LocationID

--Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
CREATE VIEW Managers
AS
  SELECT E.FirstName+' '+ E.LastName AS names
       , E.HireDate
	   , E.Salary
	   , D.DepartmentName
  FROM Departments D 
  JOIN  Employees E
  ON D.ManagerID=E.EmployeeID
  WHERE DATEDIFF(yyyy, E.HireDate,GETDATE()) >15
SELECT * FROM Managers