---additional work or practice queries
--1.Write create table syntax for employee table
CREATE DATABASE NewEmpDB
CREATE TABLE Employee(
EMPLOYEE_ID INT	PRIMARY KEY NOT NULL,
FIRST_NAME	VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY MONEY,	
JOINING_DATE DATETIME,	
DEPARTMENT VARCHAR(30)
);

INSERT INTO Employee VALUES(1,'John','Abraham',1000000,convert(datetime,'01-01-13 12:00:00 AM',5),'Banking'),
							(2,'Michael','Clarke',800000,convert(datetime,'01-01-13 12:00:00 AM'),'Insurance'),								
							(3,'Roy','Thomas',700000,convert(datetime,'01-02-13 12:00:00 AM',5),'Banking'),
							(4,'Tom','Jose',600000,convert(datetime,'01-02-13 12:00:00 AM',5),'Insurance'),
							(5,'Jerry','Pinto',650000,convert(datetime,'01-02-13 12:00:00 AM',5),'Insurance'),
							(6,'Philip','Mathew',750000,convert(datetime,'01-01-13 12:00:00 AM',5),'Services'),
							(7,'TestName1','123',650000,convert(datetime,'01-01-13 12:00:00 AM',5),'Services'),
							(8,'TestName2','Lname%',600000,convert(datetime,'01-02-13 12:00:00 AM',5),'Insurance')
CREATE TABLE Incentives(
EMPLOYEE_REF_ID	INT FOREIGN KEY REFERENCES Employee(EMPLOYEE_ID),
INCENTIVE_DATE	DATE,
INCENTIVE_AMOUNT MONEY
);

INSERT INTO Incentives VALUES(1,'01-FEB-13',5000),
							(2,'01-FEB-13',3000),
							(3,'01-FEB-13',4000),
							(1,'01-JAN-13',4500),
							(2,'01-JAN-13',3500)


SELECT FORMAT(JOINING_DATE, N'dd-MMM-yyyy hh.mm.ss tt')
FROM Employee 

--2. Get all employee details from the employee table
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY,FORMAT(JOINING_DATE, N'dd-MMM-yyyy hh.mm.ss tt') AS JOINING_DATE,DEPARTMENT FROM Employee

--3. Get First_Name, Last_Name from employee table
SELECT FIRST_NAME,LAST_NAME FROM Employee

--4.  Get First_Name from employee table using alias name “Employee Name”
SELECT FIRST_NAME AS 'Employee Name' FROM Employee

--5.  Get First_Name from employee table in upper case
SELECT UPPER(FIRST_NAME)  FROM Employee

--6. Get First_Name from employee table in lower case
SELECT LOWER(FIRST_NAME)  FROM Employee

--7.  Get unique DEPARTMENT from employee table
SELECT DISTINCT DEPARTMENT FROM Employee

--8. Select first 3 characters of FIRST_NAME from EMPLOYEE.
SELECT LEFT(FIRST_NAME,3),FIRST_NAME FROM Employee

--9.  Get position of 'o' in name 'John' from employee table
SELECT CHARINDEX('o',FIRST_NAME) FROM Employee WHERE FIRST_NAME = 'John'

--10. Get FIRST_NAME from employee table after removing white spaces from right side
SELECT RTRIM(FIRST_NAME) FROM Employee

--11. Get FIRST_NAME from employee table after removing white spaces from left side
SELECT LTRIM(FIRST_NAME) FROM Employee

--12.  Get length of FIRST_NAME from employee table
SELECT LEN(FIRST_NAME) FROM Employee

--13.  Get First_Name from employee table after replacing 'o' with '$'
SELECT REPLACE(FIRST_NAME,'o','$') FROM Employee

--14. Get First_Name and Last_Name as single column from employee table separated by a '_'
SELECT FIRST_NAME+'_'+LAST_NAME FROM Employee

--15. Get FIRST_NAME ,Joining year,Joining Month and Joining Date from employee table
SELECT FIRST_NAME,DATENAME(YYYY,JOINING_DATE) AS JoiningYear,DATENAME(MM,JOINING_DATE) AS JoiningMonth,DATENAME(DD,JOINING_DATE) AS JoiningDate FROM Employee
--16.  Get all employee details from the employee table order by First_Name Ascending
SELECT * FROM Employee 
ORDER BY FIRST_NAME ASC

--17. Get all employee details from the employee table order by First_Name descending
SELECT * FROM Employee 
ORDER BY FIRST_NAME DESC

--18. Get all employee details from the employee table order by First_Name Ascending and Salary descending
SELECT * FROM Employee 
ORDER BY FIRST_NAME ASC,SALARY DESC

--19. Get employee details from employee table whose employee name is “John”
SELECT * FROM Employee WHERE FIRST_NAME='John'

--20.  Get employee details from employee table whose employee name are “John” and “Roy”
SELECT * FROM Employee WHERE FIRST_NAME='John' OR FIRST_NAME='Roy' 
--OR
SELECT * FROM Employee WHERE FIRST_NAME IN('John','Roy')

--21. Get employee details from employee table whose employee name are not “John” and “Roy”
SELECT * FROM Employee WHERE FIRST_NAME NOT IN('John','Roy')

--22. Get employee details from employee table whose first name starts with 'J'
SELECT * FROM Employee WHERE FIRST_NAME LIKE('J%')

--23. Get employee details from employee table whose first name contains 'o'
SELECT * FROM Employee WHERE FIRST_NAME LIKE('%O%')

--24. Get employee details from employee table whose first name ends with 'n'
SELECT * FROM Employee WHERE FIRST_NAME LIKE('%N')

--25. Get employee details from employee table whose first name ends with 'n' and name contains 4 letters
SELECT * FROM Employee WHERE FIRST_NAME LIKE('%N') AND LEN(FIRST_NAME)=4

--26.  Get employee details from employee table whose first name starts with 'J' and name contains 4 letters
SELECT * FROM Employee WHERE FIRST_NAME LIKE('J%') AND LEN(FIRST_NAME)=4

--27.  Get employee details from employee table whose Salary greater than 600000
SELECT * FROM Employee WHERE SALARY>600000

--28.  Get employee details from employee table whose Salary less than 800000
SELECT * FROM Employee WHERE SALARY<800000

--29. Get employee details from employee table whose Salary between 500000 and 800000
SELECT * FROM Employee WHERE SALARY BETWEEN 500000 AND 800000

--30. Get employee details from employee table whose name is 'John' and 'Michael'
SELECT * FROM Employee WHERE FIRST_NAME IN('John','Michael')

--31. Get employee details from employee table whose joining year is “2013”
SELECT * FROM Employee WHERE DATENAME(YYYY,JOINING_DATE)=2013

--32. Get employee details from employee table whose joining month is “January”
SELECT * FROM Employee WHERE DATENAME(MM,JOINING_DATE)='January'

--33. Get employee details from employee table who joined before January 31st 2013
SELECT * FROM Employee WHERE JOINING_DATE < '2013-01-31'

--34.  Get employee details from employee table who joined after January 31st
SELECT * FROM Employee WHERE JOINING_DATE > '2013-01-31'

--35.  Get Joining Date and Time from employee table
SELECT FORMAT(JOINING_DATE, N'dd-MM-yyyy hh.mm ')
FROM Employee 

--36. Get Joining Date,Time including milliseconds from employee table
SELECT FORMAT(JOINING_DATE, N'dd-MM-yyyy hh.mm.ss tt')
FROM Employee 

--37.  Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table
SELECT DATEDIFF(DD,E.JOINING_DATE,I.INCENTIVE_DATE)
FROM Employee E 
INNER JOIN Incentives I ON E.EMPLOYEE_ID = I.EMPLOYEE_REF_ID

--38. Get database date
SELECT GETDATE()

--39.  Get names of employees from employee table who has '%' in Last_Name. 
--Tip : Escape character for special characters in a query.
Select FIRST_NAME FROM EMPLOYEE WHERE LAST_NAME LIKE '%\%%';

--40.  Get Last Name from employee table after replacing special character with white space
SELECT REPLACE(LAST_NAME,'%',' ') FROM Employee

