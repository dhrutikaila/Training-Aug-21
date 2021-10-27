
-------DATE QUERY---------
/*1. Write a query to display the first day of the month (in datetime format) three months before the current month. 
Sample current date : 2014-09-03 
Expected result : 2014-06-01*/

SELECT DATEFROMPARTS(YEAR(GETDATE()) ,DATEPART(MONTH, DATEADD(MONTH, -3, GETDATE())), 01)

/*Write a query to display the last day of the month (in datetime format) three months before the current month*/


SELECT DATEFROMPARTS(YEAR(GETDATE()) ,DATEPART(MONTH, DATEADD(MONTH, -3, GETDATE())) ,DATEPART(DAY,EOMONTH(GETDATE())))

/*Write a query to get the distinct Mondays from hire_date in employees tables. */

--REPEAT

/*Write a query to get the first day of the current year. */

SELECT DATEFROMPARTS(YEAR(GETDATE()),01,01) AS 'FIRSTDATE'

/*Write a query to get the last day of the current year. */

SELECT DATEFROMPARTS(YEAR(GETDATE()),12,31) AS 'LASTDATE'

/*Write a query to calculate the age in year. */

SELECT DATEDIFF(YEAR, '17-08-2000',GETDATE()) AS 'AGE' 

/*Write a query to get the current date in the following format. 
Sample date : 2014-09-04
Output : September 4, 2014*/

SELECT  DATENAME(MONTH,GETDATE())+' ' +DATENAME(DAY,GETDATE()) + ', '+ DATENAME(YEAR,GETDATE())

/*Write a query to get the current date in the following format. 
Thursday September 2014*/

SELECT DATENAME(WEEKDAY,GETDATE()) +' , '+ DATENAME(MONTH,GETDATE()) +' '+ DATENAME(YEAR,GETDATE()) 'DATE'

/*Write a query to extract the year from the current date.*/ 

SELECT DATEPART(YEAR,GETDATE())

/*Write a query to get the DATE value from a given day (number in N). 
Sample days : 730677
Output : 2000-07-11*/

--Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' 
SELECT FirstName, HireDate FROM Employees
WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

/*12. Write a query to display the current date in the following format. 
Sample output : Thursday 4th September 2014*/
SELECT DATENAME(WEEKDAY,GETDATE()) +' , '+ DATENAME(DAY,GETDATE()) +'th '+ DATENAME(MONTH,GETDATE()) +' '+DATENAME(YEAR,GETDATE()) 'DATE'


/*13.Write a query to display the current date in the following format. 
Sample output : 05/09/2014*/
DECLARE @d DATE = GETDATE()
SELECT FORMAT(@d , 'dd/MM/yyyy') AS 'Date'

/*14.Write a query to display the current date in the following format. 
Sample output : 12:00 AM Sep 5, 2014*/
--repeat

--15. Write a query to get the firstname, lastname who joined in the month of June. 
--repeat

/*16. Write a query to get the years in which more than 10 employees joined. */
SELECT * FROM Employees

SELECT DATEPART(YEAR,HireDate) 'YEAR' FROM Employees GROUP BY DATEPART(YEAR,HireDate)


/*17. Write a query to get the department ID, year, and number of employees joined. */

SELECT DepartmentID, DATEPART(yyyy,HireDate) AS 'Year', COUNT(*) AS  'Total'
FROM Employees GROUP BY DepartmentID, DATEPART(yyyy,HireDate) 

/*18. Write a query to get department name, manager name, and salary of the manager for all managers 
whose experience is more than 5 years.*/ 

SELECT m.FirstName+' '+m.LastName 'MANAGER NAME' ,d.DepartmentName,m.Salary
FROM Employees e
JOIN Employees m ON e.EmployeeID=m.ManagerID JOIN
Departments d ON d.DepartmentID=d.DepartmentID
WHERE DATEDIFF(YEAR,e.HireDate,GETDATE())>5

/*19. Write a query to get employee ID, last name, and date of first salary of the employees. */
SELECT * FROM Employees
SELECT EmployeeID, LastName, HireDate, DATEADD(MONTH,1,HireDate) AS 'First Salary'
FROM Employees

/*20. Write a query to get first name, hire date and experience of the employees. */

SELECT FirstName, HireDate, DATEDIFF(YEAR,HireDate,GETDATE()) AS 'Experience'
FROM Employees

/*21. Write a query to get first name of employees who joined in 1987. */

SELECT FirstName , LastName , HireDate FROM Employees WHERE DATEPART(YEAR,HireDate)=1987