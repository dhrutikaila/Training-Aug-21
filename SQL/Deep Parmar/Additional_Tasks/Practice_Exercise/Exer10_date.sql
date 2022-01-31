--1. Write a query to display the first day of the month (in datetime format) three months before the current month.
--Sample current date : 2014-09-03
--Expected result : 2014-06-01

	 SELECT DATEADD(MM,-3,DATEADD(DD,-DAY(GETDATE())+1,GETDATE())) AS  First_Day_Of_The_Month  
   

--2. Write a query to display the last day of the month (in datetime format) three months before the current month.

	 SELECT EOMONTH(DATEADD(MM,-3,GETDATE())) AS  Last_Day_Of_The_Month

	 SELECT DATEADD(MM,-2,DATEADD(DD,-DAY(GETDATE()),GETDATE())) AS  Last_Day_Of_The_Month 

--3. Write a query to get the distinct Mondays from hire_date in employees tables.

	 SELECT DISTINCT HireDate FROM Employees WHERE DATENAME(WEEKDAY,HireDate)='MONDAY'

--4. Write a query to get the first day of the current year.

	 SELECT DATEADD(MM,-DATEPART(MM,GETDATE())+1,DATEADD(DD,-DATEPART(DD,GETDATE())+1,GETDATE())) AS First_Day_Of_The_Current_Year

--5. Write a query to get the last day of the current year.

	 SELECT DATEADD(MM,-DATEPART(MM,GETDATE())+2,DATEADD(DD,-DATEPART(DD,GETDATE()),GETDATE())) AS Last_Day_Of_The_Current_Year

--6. Write a query to calculate the age in year.

	 SELECT DATEDIFF(YYYY,'2000-01-14',GETDATE()) AS AGE

--7. Write a query to get the current date in the following format.
--Sample date : 2014-09-04
--Output : September 4, 2014

	 SELECT FORMAT(GETDATE(),'MMMM dd,yyyy') AS [Current_DATE]

--8. Write a query to get the current date in the following format.
--Thursday September 2014

	 SELECT FORMAT(GETDATE(),'dddd MMMM yyyy') AS [Current_DATE]

--9. Write a query to extract the year from the current date.

	 SELECT YEAR(GETDATE()) AS [Current_YEAR]

--10. Write a query to get the DATE value from a given day (number in N).
--Sample days : 730677
--Output : 2000-07-11

	  SELECT DATEADD(DAY,730677,0)

	  SELECT CONVERT(DATETIME,730677,101)

--11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30'

	 SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

--12. Write a query to display the current date in the following format.
--Sample output : Thursday 4th September 2014

	 DECLARE @Date datetime
-- I am using @date variables
	 SET @Date = Getdate()
 
  SELECT   CASE 
			WHEN DAY(@Date) IN (1,21,31) THEN (FORMAT(@Date,'dddd d')+'st '+FORMAT(@Date,'MMMM yyyy'))
            WHEN DAY(@Date) IN (2,22) THEN (FORMAT(@Date,'dddd d')+'nd '+FORMAT(@Date,'MMMM yyyy'))
            WHEN DAY(@Date) IN (3,23) THEN (FORMAT(@Date,'dddd d')+'rd '+FORMAT(@Date,'MMMM yyyy'))
            ELSE (FORMAT(@Date,'dddd d')+'th '+FORMAT(@Date,'MMMM yyyy'))
			END 
       

--13.Write a query to display the current date in the following format.
--Sample output : 05/09/2014

	 SELECT FORMAT(GETDATE(),'dd/MM/yyyy') AS [Current_DATE]

	 --ANOTHER WAY:

	 SELECT DATENAME(DD,GETDATE())+'/'+CAST(DATEPART(MM,GETDATE()) AS VARCHAR(3))+'/'+DATENAME(YYYY,GETDATE()) AS [Current_DATE]

--14.Write a query to display the current date in the following format.
--Sample output : 12:00 AM Sep 5, 2014

	 SELECT FORMAT(GETDATE(),'hh:mm tt MMM d, yyyy') AS [Current_DATE]

--15. Write a query to get the firstname, lastname who joined in the month of June.

	 SELECT FirstName,LastName FROM Employees WHERE DATENAME(MM,HireDate)='June'

--16. Write a query to get the years in which more than 10 employees joined.

	  SELECT COUNT(EmployeeID) AS Total_Employee,YEAR(HireDate) AS [YEAR] FROM Employees GROUP BY YEAR(HireDate) HAVING COUNT(EmployeeID)>10

--17. Write a query to get the department ID, year, and number of employees joined.

	  SELECT DPT.DepartmentID,YEAR(HireDate) AS [YEAR],COUNT(EMP.EmployeeID) AS Number_Of_Employees FROM Departments AS DPT
	  JOIN Employees AS EMP ON DPT.DepartmentID=EMP.DepartmentID GROUP BY DPT.DepartmentID,YEAR(HireDate)

--18. Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.

	  SELECT DPT.DepartmentName,(EMP.FirstName+SPACE(1)+EMP.LastName) AS Manager_Name,EMP.Salary FROM Departments AS DPT 
	  JOIN Employees AS EMP ON EMP.ManagerID=DPT.ManagerID
	  WHERE DATEDIFF(YYYY,HireDate,GETDATE()) > 5

--19. Write a query to get employee ID, last name, and date of first salary of the employees.

	  SELECT EmployeeID,LastName,DATEADD(MM,1,HireDate) AS Date_Of_First_Salary FROM Employees

--20. Write a query to get first name, hire date and experience of the employees.

	  SELECT FirstName,HireDate,(GETDATE()-CAST(HireDate AS VARCHAR)) AS Experience FROM Employees

--21. Write a query to get first name of employees who joined in 1987.
	  
	  SELECT FirstName FROM Employees WHERE DATEPART(YYYY,HireDate)=1987