/* 1. Write a query that displays the FirstName and the length of the FirstName for all employees 
whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label.
Sort the results by the employees’ FirstName  */

select FirstName,length=len(FirstName) from Employees where FirstName like 'A%'or FirstName like 'J%' or FirstName like 'M%'

/* 2. Write a query to display the FirstName and Salary for all employees. 
Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.  */

select FirstName,SALARY=(select concat(REPLICATE('$',(10-len(salary))),salary)) from Employees

/* 3. Write a query to display the employees with their code, first name, last name and 
hire date who hired either on seventh day of any month or seventh month in any year.*/ 

SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees where DATEPART(MM,HireDate)=7 or DATEPART(DD,HireDate)=7

/* 4. Write a query to display the length of first name for employees where last name 
contains character ‘c’ after 2nd position.  */

select FirstName,LastName,length=(select len(FirstName)) from Employees where CHARINDEX('c',LastName)>2

--5. Write a query to extract the last 4 character of PhoneNumber.

select FirstName,PhoneNumber=(select RIGHT(PhoneNumber,4)) from Employees

/* 6. Write a query to update the portion of the PhoneNumber in the employees table,
within the phone number the substring ‘124’ will be replaced by ‘999’.*/

select replace(PhoneNumber,'124','999') from Employees
	
--7. Write a query to calculate the age in year.

select Age=(DATEDIFF(yy,HireDate,SYSDATETIME())) from Employees

--8. Write a query to get the distinct Mondays from HireDate in employees tables.

select FirstName, LastName,HireDate  from Employees where DATEPART(DW,HireDate)=2

/*9. Write a query to get the FirstName and HireDate from Employees table where HireDate 
between ‘1987-06-01’ and ‘1987-07-30’*/

select FirstName,HireDate  from Employees where HireDate between '1987-06-01' and '1987-07-30'

--10. Write a query to display the current date in the following format.

select currentdate=FORMAT(GETDATE(),'hh:MM tt MMMM dd,yyyy')
select currentdate=FORMAT(HireDate,'hh:MM tt MMMM dd,yyyy') from Employees

--12. Write a query to get the FirstName, LastName who joined in the month of June.

select FirstName, LastName  from Employees where DATEPART(mm,HireDate)=7

--13.Write a query to get first name, hire date and experience of the employees.

select FirstName, HireDate,Experience=(DATEDIFF(yy,HireDate,SYSDATETIME()))  from Employees

--14. Write a query to get first name of employees who joined in 1987.

select FirstName,HireDate  from Employees where DATEPART(yy,HireDate)=1987