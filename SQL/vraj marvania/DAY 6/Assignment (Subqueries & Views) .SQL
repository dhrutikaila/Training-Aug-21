--Assignment:
--Note: Refer existing employee Table

--1.SELECT employee details FROM employee table if data exists in incentive table ?

    SELECT * FROM Employee 
    WHERE EMPLOYEE_ID IN  (SELECT EMPLOYEE_REF_ID FROM Incentives)


--2.Find Salary of the employee whose salary is more than Roy Salary

	SELECT * FROM Employee 
	WHERE SALARY>(SELECT SALARY FROM Employee WHERE FIRST_NAME='Roy')

       
--3.Create a view to SELECT FirstName,LastName,Salary,JOINingDate,IncentiveDate and   IncentiveAmount
                   
   	CREATE VIEW Emp
   	AS
   	SELECT  FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,INCENTIVE_DATE,INCENTIVE_AMOUNT 
   	FROM Employee AS [E]  LEFT JOIN Incentives AS [I] 
   	ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID

/*4.Create a view to SELECT  first_name, incentive amount FROM
  employee and incentives table for those employees who have incentives and incentive   amount greater than 3000*/

    CREATE VIEW EmpIncentive
  	AS
  	(
	   SELECT FIRST_NAME,INCENTIVE_AMOUNT 
	   FROM Employee AS E 
	   JOIN Incentives ON EMPLOYEE_REF_ID= E.EMPLOYEE_ID 
	   WHERE INCENTIVE_AMOUNT>3000
	)
    SELECT * FROM EmpIncentive 




                                     

--(Note refer tables from sql supported files)

/*1.Create a View to Find the names (first_name, last_name), job, department number, and    department name of the employees who work in London*/
  
 	CREATE VIEW Empworkplace
  	AS
 	(
		SELECT CONCAT(e.FirstName,' ',e.LastName) as [NAME],e.JobId,d.DepartmentID,d.DepartmentName 
		FROM Employees as [e] 
		JOIN (SELECT * FROM Departments WHERE locationID = (SELECT LocationID FROM  Locations   where City ='London')) as [d]
		ON e.DepartmentID=d.DepartmentID
	)

/*2.Create a View to get the department name and number of employees in the department.*/
   
  	CREATE VIEW Departmentdata
  	AS
  	(
		SELECT d.DepartmentName,count(e.EmployeeID) as [number of employees] 
		FROM Employees as [e] INNER JOIN Departments[d]
		ON e.DepartmentID =d.DepartmentID
		group by(DepartmentName)
	)

--3.Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 FROM job history.
  
    CREATE VIEW Emp_history
    AS
    ( 
		SELECT EM.EmployeeID,EM.JobID,DATEDIFF(DAY,StartDate,EndDate) AS [Days] 
		FROM employees EM JOIN JobHistory AS [JO] 
		ON Em.EmployeeID = JO.EmployeeID
    )

/*4.Write a View to display the department name, manager name, and city.*/

  	CREATE VIEW Manager_Detils
  	AS
  	(
	    SELECT dl.DepartmentName,emp.Firstname as [manager name],dl.City
	    FROM(SELECT e.DepartmentID,e.DepartmentName,e.ManagerID,l.City 
	    FROM Departments as [e] 
        JOIN Locations   as [l]   ON e.LocationID=l.LocationID)  as [dl]
        JOIN Employees   as [emp] ON dl.ManagerID =emp.EmployeeID
    ) 


/*5.Create a View to display department name, 
  name (first_name, last_name), hire date, salary of the 
  manager for all managers whose experience is more than 15 years.*/

 	CREATE VIEW ManagerExp
  	AS
   	(
		SELECT CONCAT(emp.FirstName,' ',emp.LastName)as [Name],dl.DepartmentName,emp.HireDate,Salary
		FROM(SELECT e.DepartmentID,e.DepartmentName,e.ManagerID,l.City FROM Departments as [e] 
		JOIN Locations as [l] ON e.LocationID=l.LocationID) as [dl]    
		JOIN Employees as [emp] ON dl.ManagerID =emp.EmployeeID
		WHERE DATEDiff(year,HireDate,GETDATE())>15

	)  
