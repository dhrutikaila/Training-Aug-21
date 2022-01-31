-- Q1 Write a query to display the first day of the month (in datetime format) three months before the current month.
-- Sample current date : 2014-09-03
--Expected result : 2014-06-01

DECLARE @date date
SELECT @date = DATEADD(MONTH,-3,GETDATE())
SELECT DATEFROMPARTS ( YEAR(@date),MONTH( @date),01)



-- Q2 Write a query to display the last day of the month (in datetime format) three months before the current month.

SELECT EOMONTH( DATEADD(MM,-3,GETDATE()) )



-- Q3 Write a query to get the distinct Mondays from hire_date in employees tables.

SELECT DISTINCT DATENAME(DAYOFYEAR,HireDate),HireDate FROM dbo.Employees WHERE DATENAME(WEEKDAY,HireDate) = 'Monday'



-- Q4 Write a query to get the first day of the current year.

SELECT DATENAME(WEEKDAY,DATEFROMPARTS(YEAR(GETDATE()),1,1))



-- Q5 Write a query to get the last day of the current year.

SELECT DATENAME(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()),12,31) )


-- SELECT
  -- DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) AS StartOfYear,
  -- DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1) AS EndOfYear



-- Q6 Write a query to calculate the age in year.

SELECT DATEDIFF(YEAR,'2000-12-19',GETDATE())



-- Q7 Write a query to get the current date in the following format.
-- Sample date : 2014-09-04
-- Output : September 4, 2014

SELECT FORMAT(GETDATE(),'MMMM dd, yyyy')



-- Q8 Write a query to get the current date in the following format.
-- Thursday September 2014

SELECT FORMAT(GETDATE(),'dddd MMMM yyyy')



-- Q9 Write a query to extract the year from the current date.

SELECT YEAR(GETDATE())



-- Q10 Write a query to get the DATE value from a given day (number in N).
-- Sample days : 730677
-- Output : 2000-07-11

SELECT DATEADD(DAY,730677,0)


-- Q11 Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30'

SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' and '1987-07-30'



-- Q12 Write a query to display the current date in the following format.
--Sample output : Thursday 4th September 2014

SELECT FORMAT(GETDATE(),'dddd d"th" MMMM yyyy')



-- Q13 Write a query to display the current date in the following format.
--Sample output : 05/09/2014

SELECT FORMAT(GETDATE(),'d','us')



-- Q14 Write a query to display the current date in the following format.
--Sample output : 12:00 AM Sep 5, 2014

SELECT FORMAT(GETDATE(),'hh:mm tt MMM d, yyyy')



-- Q15 Write a query to get the firstname, lastname who joined in the month of June.

SELECT FirstName,LastName,HireDate FROM Employees WHERE DATENAME(MONTH,HireDate) = 'June'



-- Q16 Write a query to get the years in which more than 10 employees joined.

SELECT COUNT(EmployeeID),YEAR(HireDate) FROM Employees
GROUP BY YEAR(HireDate)
HAVING COUNT(EmployeeID) > 10



-- Q17 Write a query to get the department ID, year, and number of employees joined.

SELECT DepartmentID,YEAR(HireDate),COUNT(EmployeeID) FROM Employees
GROUP BY DepartmentID,YEAR(HireDate)



-- Q18 Write a query to get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.

SELECT d.DepartmentName,e.FirstName,e.Salary FROM Departments d
	JOIN Employees e ON e.EmployeeID = d.ManagerID
WHERE DATEDIFF(YEAR,e.HireDate,GETDATE()) > 5



-- Q19 Write a query to get employee ID, last name, and date of first salary of the employees.

SELECT EmployeeID,LastName, HireDate, EOMONTH(HireDate) FROM Employees



-- Q20 Write a query to get first name, hire date and experience of the employees.

SELECT FirstName,HireDate,'YOE' = DATEDIFF(YEAR,HireDate,GETDATE()) FROM Employees



-- Q21 Write a query to get first name of employees who joined in 1987.

SELECT FirstName FROM Employees WHERE YEAR(HireDate) = 1987
