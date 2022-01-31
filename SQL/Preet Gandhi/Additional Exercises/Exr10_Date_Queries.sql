USE Additional_Practice
--Main Database--

--1)Write a query to display the first day of the month (in datetime format) three months 
--  before the current month. 
--Sample current date : 2014-09-03 Expected result : 2014-06-01
SELECT DATEFROMPARTS(DATEPART(yy, DATEADD(mm, -3, GETDATE())), 
DATEPART(mm, DATEADD(mm, -3, GETDATE())), 01) AS 'Format'

--2)Write a query to display the last day of the month (in datetime format) three months 
--  before the current month. 
SELECT EOMONTH(GETDATE(), -3)

--3)Write a query to get the distinct Mondays from hire_date in employees tables. 
SELECT HireDate FROM Employees WHERE DATENAME(weekday,HireDate) = 'Monday'

--4)Write a query to get the first day of the current year. 
SELECT DATEFROMPARTS(YEAR(GETDATE()), 1, 1)

--5)Write a query to get the last day of the current year. 
SELECT DATEFROMPARTS(YEAR(GETDATE()), 12, 31)

--6)Write a query to calculate the age in year. 
SELECT DATEDIFF(yy,'2000-07-08',GETDATE()) AS 'Age'

--7)Write a query to get the current date in the following format. 
--Sample date : 2014-09-04 Output : September 4, 2014
SELECT FORMAT(GETDATE(), 'MMMM d, yyyy') AS 'Format' 

--8)Write a query to get the current date in the following format. 
--Thursday September 2014
SELECT CONCAT(DATENAME(WEEKDAY,GETDATE()),' ',FORMAT (GETDATE(), ' MMMM yyyy')) AS 'Format'

--9)Write a query to extract the year from the current date. 
SELECT DATENAME(yy,GETDATE()) AS 'Year'

--10)Write a query to get the DATE value from a given day (number in N). 
--Sample days : 730677 Output : 2000-07-11
DECLARE @addDate INT = 2
SELECT DATEADD(DAY,@addDate,GETDATE())

--11)Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' 
SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

--12)Write a query to display the current date in the following format. 
--Sample output : Thursday 4th September 2014
DECLARE @DateFormat DATETIME
SET @DateFormat = GETDATE()
SELECT   CASE
            WHEN DAY(@DateFormat) IN (1,21,31) THEN (FORMAT(@DateFormat,'dddd d')+'st '+FORMAT(@DateFormat,'MMMM yyyy'))
            WHEN DAY(@DateFormat) IN (2,22) THEN (FORMAT(@DateFormat,'dddd d')+'nd '+FORMAT(@DateFormat,'MMMM yyyy'))
            WHEN DAY(@DateFormat) IN (3,23) THEN (FORMAT(@DateFormat,'dddd d')+'rd '+FORMAT(@DateFormat,'MMMM yyyy'))
            ELSE (FORMAT(@DateFormat,'dddd d')+'th '+FORMAT(@DateFormat,'MMMM yyyy'))
            END 

--13)Write a query to display the current date in the following format. 
--Sample output : 05/09/2014
SELECT FORMAT (GETDATE(),'dd/MM/yyyy')

--14)Write a query to display the current date in the following format. 
--Sample output : 12:00 AM Sep 5, 2014
SELECT FORMAT (GETDATE(), 'hh:mm tt MMM d, yyyy') AS 'Format'

--15)Write a query to get the firstname, lastname who joined in the month of June. 
SELECT FirstName,LastName FROM Employees WHERE DATENAME(MONTH,HireDate)='June'

--16)Write a query to get the years in which more than 10 employees joined. 
SELECT DATENAME(YEAR,HireDate) AS 'Years' FROM Employees 
GROUP BY DATENAME(YEAR,HireDate) HAVING COUNT(EmployeeID) > 10

--17)Write a query to get the department ID, year, and number of employees joined. 
SELECT DepartmentID, DATENAME(YEAR,HireDate) AS 'YEAR', COUNT(EmployeeID) 'NoOfEmployees' FROM Employees 
GROUP BY DepartmentID,DATENAME(YEAR,HireDate) ORDER BY DepartmentID

--18)Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years. 
SELECT DepartmentName, FirstName, Salary FROM Departments D INNER JOIN Employees E ON (D.ManagerID=E.EmployeeID) 
WHERE DATEDIFF(dd,HireDate,GETDATE())/365 > 5

--19)Write a query to get employee ID, last name, and date of first salary of the employees. 
SELECT EmployeeID, LastName, EOMONTH(HireDate, 0) AS 'Salary Date' FROM Employees

--20) Write a query to get first name, hire date and experience of the employees. 
SELECT FirstName,HireDate,DATEDIFF(yy,HireDate,GETDATE()) AS 'Experience' FROM Employees

--21)Write a query to get first name of employees who joined in 1987. 
SELECT FirstName FROM Employees WHERE DATEPART(yy,HireDate)='1987'