/*
1. Write a query to display the first day of the month (in datetime format) three months before the current month. 
*/
select cast(dateadd(month, -3, dateadd(day, 1 - day(getdate()-2), getdate()-2)) as date)

/*
2.Write a query to display the last day of the month (in datetime format) three months before the current month. 
*/
SELECT FORMAT(eomonth(GETDATE(),-6),N'dd-MM-yyyy')

/*
3.Write a query to get the distinct Mondays from hire_date in employees tables. 
*/
SELECT HireDate FROM Employees 
WHERE DATENAME(WEEKDAY,HireDate)= 'MONDAY'

/*
4.Write a query to get the first day of the current year.
*/
SELECT DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0) AS StartOfYear
  
/*
5.Write a query to get the last day of the current year. 
*/
SELECT DATEADD(yy, DATEDIFF(yy, 0, GETDATE())+1, -1) AS EndOfYear
  
/*
6.Write a query to calculate the age in year.
*/
select datediff(yy,CONVERT(datetime,'05-04-2000'),GETDATE())

/*
7.Write a query to get the current date in the following format. 
September 4, 2014
*/
SELECT FORMAT(GETDATE(),N'MMMM dd, yyyy')

/*
8.Write a query to get the current date in the following format. 
Thursday September 2014
*/
SELECT DATENAME(weekday,getdate()) +' ' + FORMAT(GETDATE(),N'MMMM yyyy')

/*
9.Write a query to extract the year from the current date. 
*/
SELECT DATEPART(YYYY,GETDATE())

/*
10.Write a query to get the DATE value from a given day (number in N). 
Sample days : 730677
Output : 2000-07-11
*/
SELECT dateadd(day,730677,0)

/*
11.Write a query to get the first name and hire date from employees table where hire date between
'1987-06-01' and '1987-07-30' 
*/
SELECT FirstName,HireDate FROM Employees 
WHERE HireDate BETWEEN '1987-06-01' and '1987-07-30'


/*
12.Write a query to display the current date in the following format. 
Sample output : Thursday 4th September 2014
*/
DECLARE @Date datetime
set @Date = '2078-10-21'
SELECT   CASE
            WHEN DAY(@Date) in (1,21,31) THEN (FORMAT(@date,'dddd dd')+'st '+FORMAT(@date,'MMMM yyyy'))
            WHEN DAY(@Date) IN (2,22) THEN (FORMAT(@date,'dddd dd')+'nd '+FORMAT(@date,'MMMM yyyy'))
            WHEN DAY(@Date) IN (3,23) THEN (FORMAT(@date,'dddd dd')+'rd '+FORMAT(@date,'MMMM yyyy'))
            ELSE (FORMAT(@date,'dddd dd')+'th '+FORMAT(@date,'MMMM yyyy'))
            END 


/*
13.Write a query to display the current date in the following format. 
Sample output : 05/09/2014
*/
SELECT FORMAT(GETDATE(),N'dd/MM/yyyy')

/*
14.Write a query to display the current date in the following format. 
Sample output : 12:00 AM Sep 5, 2014
*/
SELECT FORMAT(GETDATE(),N'hh:00 tt MMM dd, yyyy')


/*
15.Write a query to get the firstname, lastname who joined in the month of June. 
*/
Select FirstName,LastName FROM Employees
WHERE DATEPART(mm,HireDate) = 6

/*
16.Write a query to get the years in which more than 10 employees joined. 
*/
SELECT DATEPART(yyyy,HireDate) From Employees
GROUP BY DATEPART(yyyy,HireDate)
HAVING Count(EmployeeID)>10 

/*
17.Write a query to get the department ID, year, and number of employees joined. 
*/
SELECT DepartmentID,'Year' = DATEPART(yyyy,HireDate),Count(EmployeeID)'count' From Employees
GROUP BY DepartmentID,DATEPART(yyyy,HireDate)


/*
18.Write a query to get department name, manager name, and salary of the manager for all managers whose 
experience is more than 5 years. 
*/
SELECT DISTINCT e.FirstName,e.LastName,DepartmentName,e.Salary FROM Employees e,Employees e1,Departments d
WHERE e.EmployeeID=e1.ManagerID AND
e.DepartmentID = d.DepartmentID AND
DATEPART(YYYY,e.HireDate) > 5


/*
19.Write a query to get employee ID, last name, and date of first salary of the employees. 
*/
SELECT EmployeeID,LastName,DATEADD(MM,1,Hiredate) SalaryDate from Employees

/*
20.Write a query to get first name, hire date and experience of the employees.
*/
SELECT FirstName,HireDate,DATEDIFF(YYYY,HireDate,Getdate()) Experience FROM Employees


/*
21.Write a query to get first name of employees who joined in 1987.
*/
SELECT FirstName FROM Employees 
WHERE DATEPART(YYYY,HireDate) = 1987




