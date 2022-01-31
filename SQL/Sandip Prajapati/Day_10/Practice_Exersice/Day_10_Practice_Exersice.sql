--------------DAY-10--------------
USE SANDY
---------CURSOR
--DECLARE CURSOR
DECLARE emp_cursor CURSOR
	FOR SELECT* FROM Employees
OPEN emp_cursor
FETCH NEXT FROM emp_cursor
CLOSE emp_cursor;

--FETCH CURSOR
--OPEN
--CLOSE
DECLARE name_cursor CURSOR FOR
SELECT LastName FROM Employees
WHERE LastName LIKE 'B%'
ORDER BY LastName;

OPEN name_cursor;

FETCH NEXT FROM name_cursor;
while @@FETCH_STATUS = 0
BEGIN 
	 FETCH NEXT FROM name_cursor;
END
GO
CLOSE name_cursor;
DEALLOCATE name_cursor;

--EXAMPLE2
DECLARE @LastName VARCHAR(50), @FirstName VARCHAR(50);  
  
DECLARE contact_cursor CURSOR FOR  
SELECT LastName, FirstName FROM Employees  
WHERE LastName LIKE 'B%'  
ORDER BY LastName, FirstName;  
  
OPEN contact_cursor;  
  
-- Perform the first fetch and store the values in variables.  
-- Note: The variables are in the same order as the columns  
-- in the SELECT statement.   
  
FETCH NEXT FROM contact_cursor  
INTO @LastName, @FirstName;  
  
-- Check @@FETCH_STATUS to see if there are any more rows to fetch.  
WHILE @@FETCH_STATUS = 0  
BEGIN  
  
   -- Concatenate and display the current values in the variables.  
   PRINT 'Contact Name: ' + @FirstName + ' ' +  @LastName  
  
   -- This is executed as long as the previous fetch succeeds.  
   FETCH NEXT FROM contact_cursor  
   INTO @LastName, @FirstName;  
END  
  
CLOSE contact_cursor;  
DEALLOCATE contact_cursor;  

--SCROLL CURSOR

SELECT LastName,FirstName FROM Employees 
ORDER BY LastName,FirstName;

DECLARE fullname_cursor SCROLL CURSOR FOR
SELECT LastName,FirstName FROM Employees
ORDER BY LastName,FirstName;

OPEN fullname_cursor;

FETCH NEXT FROM fullname_cursor;

FETCH LAST FROM fullname_cursor;

FETCH PRIOR FROM fullname_cursor;

FETCH ABSOLUTE 2 FROM fullname_cursor;

FETCH RELATIVE 3 FROM fullname_cursor;

FETCH RELATIVE -2  FROM fullname_cursor;

CLOSE fullname_cursor;

DEALLOCATE fullname_cursor;