Assignment:

-- 1)Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

select FirstName as "Name", LEN(FirstName) as "Length" from  Employees 
where FirstName like 'A%' OR
	  FirstName like 'J%' OR
	  FirstName like 'M%'
order by FirstName

-- 2)Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

select Concat(REPLICATE('$',10-Len(Salary)),Salary) from employees

-- 3)Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

select EmployeeID,FirstName,LastName,HireDate from employees
where month(HireDate)= 7 OR day(HireDate) = 7;

-- 4)Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

select FirstName, len(FirstName) as lenfirstname from Employees 
where LastName like '__c%'

-- 5)Write a query to extract the last 4 character of PhoneNumber.

select right(Phonenumber,4) as last4diphone from employees

-- 6)Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

select replace(PhoneNumber , '124','999') from employees

-- 7)Write a query to calculate the age in year.

select DATEDIFF(YY,HireDate,getdate())  as yearworked from employees
-- select select DATEDIFF(YY,BirthDate,getdate())  as age from employees

-- 8)Write a query to get the distinct Mondays from HireDate in employees tables.
SELECT FirstName,HireDate  FROM dbo.Employees WHERE DATENAME(WEEKDAY,HireDate) = 'Monday'

--9)Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

select FirstName,HireDate from employees 
where HireDate between '1987-06-01' and '1987-07-30'

-- 10)Write a query to display the current date in the following format.
	--11) Sample output : 12:00 AM Sep 5, 2014

select format(getdate() , 'hh:mm tt MMMM d, yyyy')

-- 12)Write a query to get the FirstName, LastName who joined in the month of June.

select FirstName, LastName from Employees 
where datename(mm , HireDate) = 'June'

-- 13)Write a query to get first name, hire date and experience of the employees.
select FirstName, HireDate,DATEDIFF ( YYYY , HireDate , getdate() )  as Experience from Employees

-- 14)Write a query to get first name of employees who joined in 1987.

select FirstName from Employees
where year(HireDate)= 1987





