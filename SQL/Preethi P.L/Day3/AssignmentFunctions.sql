/*1)Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName*/

SELECT FirstName, CHAR_LENGTH("FirstName") AS NameLength FROM employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%' OR FirstName LIKE 'M%'

/*2)Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.*/

SELECT FirstName,Salary,LPAD(Salary,10,'$') AS SALARY FROM employees 

/*3)Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year*/

SELECT EmployeeID,FirstName,LastName,HireDate FROM employees WHERE POSITION("07" IN DATE_FORMAT(HireDate, '%d %m %Y'))>0

SELECT EmployeeID,FirstName,LastName,HireDate FROM employees WHERE POSITION('07' IN DATE_FORMAT(HireDate,'%m')) =1 OR POSITION('07' IN DATE_FORMAT(HireDate,'%d')) = 1

/*4)Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.*/

SELECT CHAR_LENGTH(FirstName) FROM employees WHERE INSTR(LastName,'c') > 2 

/*5)Write a query to extract the last 4 character of PhoneNumber.*/

SELECT RIGHT(PhoneNumber,4) FROM employees   

/*6)Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.*/

UPDATE employees SET PhoneNumber = REPLACE(PhoneNumber,'124','999') WHERE PhoneNumber LIKE '%124%'

/*8)Write a query to get the distinct Mondays from HireDate in employees tables.*/

SELECT DISTINCT(STR_TO_DATE(CONCAT(YEARWEEK(hire_date),'1'),'%x%v%w')) FROM employees

/*9)Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’*/

SELECT FirstName,HireDate FROM employees WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30'

/*10)Write a query to display the current date in the following format.Sample output : 12:00 AM Sep 5, 2014*/

SELECT DATE_FORMAT(CURRENT_DATE(),"%h:%i %p %b %d, %Y")

/*12)Write a query to get the FirstName, LastName who joined in the month of June.*/

SELECT FirstName,LastName FROM employees WHERE MONTH(HireDate) = 6

/*13)Write a query to get first name, hire date and experience of the employees.*/

SELECT FirstName,HireDate,DATE_DIFF(CURRENT_DATE,HireDate)/365 AS Experience FROM employees

/*14)Write a query to get first name of employees who joined in 1987.*/

SELECT FirstName FROM employees WHERE YEAR(HireDate) = 1987
