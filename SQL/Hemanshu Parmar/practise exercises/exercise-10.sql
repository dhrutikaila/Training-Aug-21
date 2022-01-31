--task-1. Write a query to display the first day of the month (in datetime format) three months before the current month. 
--Sample current date : 2014-09-03 
--Expected result : 2014-06-01
SELECT DATEFROMPARTS(DATEPART(YEAR, DATEADD(MONTH, -3, GETDATE())), DATEPART(MONTH, DATEADD(MONTH, -3, GETDATE())), 01)

--task-2. Write a query to display the last day of the month (in datetime format) three months before the current month. 
SELECT DATEFROMPARTS(YEAR(GETDATE()),MONTH(GETDATE()),1)
SELECT EOMONTH(GETDATE(), -3)

--task-3. Write a query to get the distinct Mondays from hire_date in employees tables. 
SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(WEEKDAY,HireDate)='2'

--task-4. Write a query to get the first day of the current year. 
SELECT DATEFROMPARTS(YEAR(GETDATE()), 1, 1)

--task-5. Write a query to get the last day of the current year. 
SELECT DATEFROMPARTS(YEAR(GETDATE()), 12, 31)

--task-6. Write a query to calculate the age in year. 
SELECT DATEDIFF(YEAR,'2000-08-31',GETDATE())

--task-7. Write a query to get the current date in the following format. 
--Sample date : 2014-09-04
--Output : September 4, 2014
SELECT FORMAT (GETDATE(), 'hh:mm tt MMM dd, yyyy') AS TIME

--task-8. Write a query to get the current date in the following format. 
--Thursday September 2014
SELECT DATENAME(WEEKDAY,GETDATE())
SELECT FORMAT (GETDATE(), 'dd MMM  yyyy') AS TIME

--task-9. Write a query to extract the year from the current date. 
SELECT DATENAME(YEAR,GETDATE())

--task-10. Write a query to get the DATE value from a given day (number in N). 
--Sample days : 730677
--Output : 2000-07-11
DECLARE @date INT=70
SELECT DATEADD(DAY,@date,'2000-07-11')

--task-11. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' 
SELECT FirstName,HireDate FROM Employees WHERE HireDate between '1987-06-01' and '1987-07-30'


--task-12. Write a query to display the current date in the following format. 
--Sample output : Thursday 4th September 2014
SELECT CONCAT ( DATENAME ( WEEKDAY, GETDATE() ), SPACE(1), DAY ( GETDATE() ), SPACE(1), DATENAME ( MONTH, GETDATE() ), SPACE(1), YEAR ( GETDATE() ) )

--task-13.Write a query to display the current date in the following format. 
--Sample output : 05/09/2014
SELECT CONVERT(VARCHAR, GETDATE(), 3)

--task-14.Write a query to display the current date in the following format. 
--Sample output : 12:00 AM Sep 5, 2014
SELECT FORMAT (GETDATE(), 'hh:mm tt MMM dd, yyyy') AS TIME


--task-15. Write a query to get the firstname, lastname who joined in the month of June. 
SELECT FirstName,LastName FROM Employees WHERE DATENAME(MONTH,HireDate)='June'


--task-16. Write a query to get the years in which more than 10 employees joined. 
SELECT DATENAME(YEAR,HireDate) AS 'Years' FROM Employees GROUP BY DATENAME(YEAR,HireDate) HAVING COUNT(EmployeeID) > 10;

--task-17. Write a query to get the department ID, year, and number of employees joined. 
SELECT DepartmentID, DATENAME(YEAR,HireDate) AS YEAR, COUNT(EmployeeID) 'No. Of Employees' FROM Employees GROUP BY DepartmentID,DATENAME(YEAR,HireDate) ORDER BY DepartmentID


--task-18. Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years. 
SELECT DepartmentName, FirstName, Salary FROM Departments D JOIN Employees E ON (D.ManagerID=E.EmployeeID)  WHERE  DATEDIFF(dd,HireDate,GETDATE())/365 > 5;

--task-19. Write a query to get employee ID, last name, and date of first salary of the employees. 
SELECT EmployeeID, LastName, EOMONTH(HireDate, 0) AS 'Salary Date' FROM Employees;


--task-20. Write a query to get first name, hire date and experience of the employees. 
SELECT FirstName AS 'Name',HireDate,CONCAT(DATEDIFF(dd,HireDate,GETDATE())/365,' ', 'Year',' ',DATEDIFF(MM,HireDate,GETDATE())%12,' ','Month') AS 'Experience' FROM Employees

--task-21. Write a query to get first name of employees who joined in 1987. 
SELECT FirstName FROM Employees WHERE DATEPART(YEAR,HireDate)='1987'
