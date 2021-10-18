-- Assignment:

-- [1] Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters �A�, �J� or �M�.
--     Give each column an appropriate label. Sort the results by the employees� FirstName.

SELECT [Name]=FirstName,LEN(FirstName) AS Length_Of_FirstName FROM Employees WHERE FirstName LIKE 'A%' OR FirstName LIKE 'J%'OR FirstName LIKE 'M%'  ORDER BY FirstName

-- [2] Write a query to display the FirstName and Salary for all employees. 
--     Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

--Solution:

    SELECT FirstName, REPLICATE('$',10-LEN(Salary))+CAST(Salary AS varchar(10)) AS SALARY FROM Employees;

-- [3] Write a query to display the employees with their code, first name, last name and hire date 
--     who hired either on seventh day of any month or seventh month in any year.

SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DATEPART(DD,HireDate) LIKE 07 OR DATEPART(MM,HireDate) LIKE 07

-- ANOTHER WAY:-
--SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE HireDate LIKE '%07' OR HireDate LIKE '____-07%'

-- [4] Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.


  SELECT LEN(FirstName) AS Length_Of_FirstName FROM Employees WHERE LastName LIKE '__C%'

  -- [5] Write a query to extract the last 4 character of PhoneNumber.

	SELECT RIGHT(PhoneNumber,4) AS PhoneNumber FROM Employees
	
-- [6] Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

	
	UPDATE Employees SET PhoneNumber=REPLACE(PhoneNumber,'124','999') WHERE PhoneNumber LIKE '%124%'

	--SELECT QUERY

	SELECT PhoneNumber FROM Employees WHERE PhoneNumber LIKE '%999%'

-- [7] Write a query to calculate the age in year.
-- Note:- i Born in year 2000 that's why i write here directly, If any database Present insted of '2000' i write that perticular column Name

    SELECT DATEDIFF(YY,'2000',CAST(YEAR(GETDATE()) AS VARCHAR(4))) AS Age

-- [8] Write a query to get the distinct Mondays from HireDate in employees tables.

		SELECT DISTINCT HireDate FROM Employees WHERE DATENAME(WEEKDAY,HireDate)='MONDAY'

-- ANOTHER WAY:-
		
		--SELECT DISTINCT HireDate FROM Employees WHERE DATEPART(DW,HireDate)=2

-- [9] Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’
	
	SELECT FirstName,HireDate FROM Employees WHERE HireDate BETWEEN '1987-06-01' and '1987-07-30'

-- [10] Write a query to display the current date in the following format.
--      Sample output : 12:00 AM Sep 5, 2014

  SELECT FORMAT(GETDATE(),'hh:mm tt MMM d, yyyy') AS [Current_Date]

-- [11] Write a query to get the FirstName, LastName who joined in the month of June.

	SELECT FirstName,LastName FROM Employees WHERE MONTH(HireDate)=6

-- [12] Write a query to get first name, hire date and experience of the employees.

     SELECT FirstName,HireDate,DATEDIFF(YY,HireDate,GETDATE()) AS Experience FROM Employees

--ANOTHER WAY IF IN PAST JOBHISTORY TABLE IS CONSIDER THEN
		--SELECT FirstName,HireDate,DATEDIFF(YY,StartDate,EndDate) AS Experience FROM Employees AS EMP 
		--LEFT JOIN JobHistory AS JH ON EMP.EmployeeID=JH.EmployeeID

-- [13] Write a query to get first name of employees who joined in 1987.

	SELECT FirstName FROM Employees WHERE YEAR(HireDate)=1987

	--ANOTHER WAY :-

		--SELECT FirstName FROM Employees WHERE HireDate LIKE '1987%'
