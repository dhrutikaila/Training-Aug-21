--1. Write a query to display the first day of the month (in datetime format) three months before the current month. 
--Sample current date : 2014-09-03 
--Expected result : 2014-06-01

SELECT DATEADD(DAY,1,EOMONTH(DATEADD(MONTH,-4,CAST(CURRENT_TIMESTAMP AS DATE)))) AS 'Date'

--2. Write a query to display the last day of the month (in datetime format) three months before the current month. 

SELECT EOMONTH(DATEADD(MONTH,-3,CAST(CURRENT_TIMESTAMP AS DATE))) AS 'Date'

--3. Write a query to get the distinct Mondays from hire_date in employees tables. 

SELECT DISTINCT HireDate
	, DATEPART(DW,HireDate)
FROM Employees
WHERE DATEPART(DW, HireDate) =  2

--4. Write a query to get the first day of the current year. 

SELECT DATEADD(YEAR,DATEDIFF(YEAR,0,GETDATE()),0) AS 'First Day'

--5. Write a query to get the last day of the current year. 

SELECT DATEADD(YEAR,DATEDIFF(YEAR,0,GETDATE())+1,-1) AS 'Last Day'

--6. Write a query to calculate the age in year. 

SELECT FLOOR((DATEDIFF(DAY, '1998-05-12', GETDATE())) / 365.25) AS 'AGE'

--7. Write a query to get the current date in the following format. 
--Sample date : 2014-09-04
--Output : September 4, 2014

SELECT FORMAT(GETDATE(),'MMMM d, yyyy') AS 'DATE'

--8. Write a query to get the current date in the following format. 
--Thursday September 2014


SELECT FORMAT(GETDATE(),'dddd MMMM yyyy') AS 'DATE'

--9. Write a query to extract the year from the current date. 

SELECT DATEPART(yyyy,GETDATE()) AS 'Year'

--10. Write a query to get the DATE value from a given day (number in N). 
--Sample days : 730677
--Output : 2000-07-11



--11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' 

SELECT FirstName
	, HireDate
FROM Employees
WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'


--12. Write a query to display the current date in the following format. 
--Sample output : Thursday 4 September 2014

SELECT FORMAT(GETDATE(),'dddd dd MMMM yyyy') AS 'Date'

--13.Write a query to display the current date in the following format. 
--Sample output : 05/09/2014

SELECT FORMAT(GETDATE(),'dd/mm/yyyy') AS 'Date'

--14.Write a query to display the current date in the following format. 
--Sample output : 12:00 AM Sep 5, 2014

SELECT FORMAT(GETDATE(), 'HH tt MMM d, yyyy') AS 'Date'

--15. Write a query to get the firstname, lastname who joined in the month of June. 

SELECT FirstName
	, LastName
	, HireDate
FROM Employees
WHERE DATEPART(MM, HireDate ) = 6

--16. Write a query to get the years in which more than 10 employees joined. 

SELECT DATEPART(yyyy,HireDate) AS 'Year'
FROM Employees
GROUP BY DATEPART(yyyy,HireDate)
HAVING COUNT(*) > 10

--17. Write a query to get the department ID, year, and number of employees joined. 

SELECT DepartmentID
	, DATEPART(yyyy,HireDate) AS 'Year'
	, COUNT(*) AS  'Total'
FROM Employees
GROUP BY DepartmentID, DATEPART(yyyy,HireDate) 

--18. Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years. 

SELECT D.DepartmentName
	, E.FirstName
	, E.Salary
FROM Departments AS D
INNER JOIN Employees AS E
	ON D.ManagerID = E.EmployeeID
WHERE DATEDIFF(YEAR,E.HireDate,GETDATE()) > 5

--19. Write a query to get employee ID, last name, and date of first salary of the employees. 

SELECT EmployeeID
	, LastName
	, HireDate
	, DATEADD(MONTH,1,HireDate) AS 'First Salary'
FROM Employees

--20. Write a query to get first name, hire date and experience of the employees. 

SELECT FirstName
	, HireDate
	, DATEDIFF(YEAR,HireDate,GETDATE()) AS 'Experience'
FROM Employees

--21. Write a query to get first name of employees who joined in 1987. 

SELECT FirstName
FROM Employees
WHERE DATEPART(YEAR,HireDate) = 1987

